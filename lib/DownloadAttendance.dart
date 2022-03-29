
import 'package:flutter/material.dart';

class DownloadAttendance extends StatefulWidget {
  const DownloadAttendance({Key? key}) : super(key: key);

  @override
  State<DownloadAttendance> createState() => _DownloadAttendanceState();
}

class _DownloadAttendanceState extends State<DownloadAttendance> {
  List<String> dropdownValuesList = [];
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValuesList = ['DB-A', 'DB-B', 'OOP-A', 'OOP-B'];
    dropdownValue = dropdownValuesList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 179, 86, 1),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Color.fromRGBO(32, 179, 86, 1),
                  size: 35,
                ),
                elevation: 16,
                style: const TextStyle(color: Colors.grey, fontSize: 35),
                underline: Container(
                  height: 2,
                  color: const Color.fromRGBO(32, 179, 86, 1),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: dropdownValuesList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    /*Download Attendance */
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(32, 179, 86, 1),
                      onPrimary: Colors.grey[300]), // Background color
                  child: const Text(
                    'Download',
                  ),
                ),
              )
            ],
          )),
    );
  }
}
