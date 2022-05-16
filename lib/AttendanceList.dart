import 'package:flutter/material.dart';

class AttendanceList extends StatefulWidget {
  final List<String> data;
  const AttendanceList({Key? key, required this.data}) : super(key: key);

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  final List<String> _studentsList = <String>[];
  final List<String> _presentList = <String>[];
  final List<String> _absentList = <String>[];
  List<String> data = <String>[];

  @override
  void initState() {
    super.initState();
    data = widget.data;
    _absentList.addAll(["Khadija Bashir"]);
    _presentList.addAll(data);
    // _presentList.addAll(["Rabbia Sajjad"]);
    _studentsList.addAll(_absentList);
    _studentsList.addAll(_presentList);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(32, 179, 86, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.check_rounded, color: Colors.white),
              onPressed: _confirmAttendance,
            ),
          ],
        ),
        body: _buildAttendanceList(),
      ),
    );
  }

  Widget _buildAttendanceList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2 *
          (_studentsList
              .length), // Sending 2x the item count because we are also using a divider at every alternate index. E.g 2 names, 2 dividers, 4 total items
      itemBuilder: (context, i) {
        if (i.isOdd) {
          //indent added to make divider line disappear. Changing color and thickness didn't work well.
          return const Divider(
            indent: 200,
            endIndent: 200,
          );
        }
        final index = i ~/ 2;

        return _buildRow(_studentsList[index]);
      },
    );
  }

  Widget _buildRow(String studentName) {
    final present = _presentList.contains(studentName);
    return Container(
      decoration: BoxDecoration(
          color:
          present ? const Color.fromRGBO(32, 179, 86, 1) : Colors.red[400],
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        title: Text(
          studentName,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 17,
          ),
        ),
        trailing: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(7))),
            child: Icon(
              present ? Icons.clear_rounded : Icons.check_rounded,
              color: present
                  ? Colors.red[400]
                  : const Color.fromRGBO(32, 179, 86, 1),
              semanticLabel: present ? 'Mark Absent' : 'Mark Present',
            ),
          ),
          onPressed: () {
            setState(() {
              if (present) {
                _presentList.remove(studentName);
                _absentList.add(studentName);
                _studentsList.clear();
                _studentsList.addAll(_absentList);
                _studentsList.addAll(_presentList);
              } else {
                _absentList.remove(studentName);
                _presentList.add(studentName);
                _studentsList.clear();
                _studentsList.addAll(_absentList);
                _studentsList.addAll(_presentList);
              }
            });
          },
        ),
      ),
    );
  }

  void _confirmAttendance() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    //TODO: Add attendance to firebase
  }
}
