import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAttendanceTables extends StatefulWidget {
  const ViewAttendanceTables({Key? key, required this.selectedClass})
      : super(key: key);
  final String selectedClass;
  @override
  State<ViewAttendanceTables> createState() => _ViewAttendanceTablesState();
}

class _ViewAttendanceTablesState extends State<ViewAttendanceTables> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Attendance")
            .where('classcode', isEqualTo: widget.selectedClass)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text("");
          } else {
            List<DropdownMenuItem> classesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              QueryDocumentSnapshot<Object?>? snap = snapshot.data?.docs[i];
              // log(snap!["date"]);
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromRGBO(32, 179, 86, 1),
              ),
              body:
              ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  // for(int i=0; i<data["studentsAttendance"].length; i++){
                  //   return ListTile(
                  //     title:Text(data["studentsAttendance"][i]["UUID"].toString()),
                  //     subtitle: Text(data["studentsAttendance"][i]["present"]? "Present": "Absent"),
                  //   );
                  // }
                  return ListTile(
                    title: Text(data['date']),
                    subtitle: Text(data["studentsAttendance"].toString()),
                  );
                }).toList(),
              )
            );
          }
          ;
        });
  }
}
