
import 'dart:io'; // for File
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DownloadAttendance extends StatefulWidget {
  const DownloadAttendance({Key? key}) : super(key: key);

  @override
  State<DownloadAttendance> createState() => _DownloadAttendanceState();
}

class _DownloadAttendanceState extends State<DownloadAttendance> {
  List<String> dropdownValuesList = [];
  String dropdownValue = '';
  String filePath = '';
  List<String> present = [];
  var value;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/attendance.csv');
  }
  getCsv() async {

    List<List<dynamic>> rows = <List<dynamic>>[];
    var collection = FirebaseFirestore.instance.collection('DB-A_Attendance');
    var docSnapshot = await collection.doc('22-04-2022').get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      value = data?['Present']; // <-- The value you want to retrieve.
      // Call setState if needed.
    }

    rows.add([
      "Present"
    ]);

    if (value != null) {
      for (int i = 0; i < value.length; i++) {
        List<dynamic> row = <dynamic>[];
        row.add(value[i]);
        rows.add(row);
      }

      File f = await _localFile;

      String csv = const ListToCsvConverter().convert(rows);
      f.writeAsString(csv);
    }
  }

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
                    getCsv();
                    /*Download Attendance */
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(32, 179, 86, 1),
                      onPrimary: Colors.grey[300]), // Background color
                  child: const Text(
                    'View Attendance',
                  ),
                ),
              )
            ],
          )),
    );
  }
}
