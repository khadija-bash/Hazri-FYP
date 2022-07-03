import 'dart:developer';
import 'dart:io'; // for File
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hazri_mvp_frontend/ViewAttendanceTables.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewAttendance extends StatefulWidget {
  const ViewAttendance({Key? key}) : super(key: key);

  @override
  State<ViewAttendance> createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  var selectedClass;
  var value;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = null;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/attendance.csv');
  }


  @override
  void initState() {
    super.initState();
    user = auth.currentUser;

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
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Classes")
                  .where('teacherID', isEqualTo: user?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  List<DropdownMenuItem> classesList = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    QueryDocumentSnapshot<Object?>? snap =
                        snapshot.data?.docs[i];

                    classesList.add(DropdownMenuItem(
                        child: Text(snap!["name"]), value: snap!["classcode"]));
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<dynamic>(
                        items: classesList,
                        hint: const Text("Select Class",
                            style: TextStyle(
                                color: Colors.grey, fontSize: 35)),
                        onChanged: (classValue) {
                          setState(() {
                            selectedClass = classValue;
                          });
                        },
                        value: selectedClass,
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Color.fromRGBO(32, 179, 86, 1),
                          size: 35,
                        ),
                        elevation: 16,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 35),
                        underline: Container(
                          height: 2,
                          color: const Color.fromRGBO(32, 179, 86, 1),
                        ),
                      )
                    ],
                  );
                }
              }),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  ViewAttendanceTables(selectedClass:selectedClass)));
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
