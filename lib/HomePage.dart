import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'EnrollmentScreen.dart';
import 'LoginScreen.dart';
import 'Timetable.dart';
import 'ViewAttendance.dart';
import 'dart:async';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isElevatedCamera = true, _isElevatedDownload = true;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Future<void> _redirectToLectureSelection() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Timetable()));

    //Reset the button that was just used
    setState(() {
      _isElevatedCamera = true;
    });
  }

  void _redirectToDownloadAttendanceScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ViewAttendance()));

    //Reset the button that was just used
    setState(() {
      _isElevatedDownload = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 179, 86, 1),
      ),
      drawer: Container(
        width: 200,
        child: Drawer(
          backgroundColor: Colors.grey[300],
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 87,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(32, 179, 86, 1),
                  ),
                  child: Center(
                      child: Text(
                        "Menu",
                        style: TextStyle(color: Colors.grey[300], fontSize: 25),
                      )),
                ),
              ),
              ListTile(
                title: const Text(
                  'Enroll in a class',
                  style: TextStyle(
                    color: const Color.fromRGBO(32, 179, 86, 1),
                  ),
                ),
                onTap: () {
                  Navigator.pop(
                      context); //To close/reset the drawer menu before redirecting
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EnrollmentScreen()));
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red[400],
                  ),
                ),
                onTap: () {
                  _signOut();
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isElevatedCamera = false;
                });
                Timer(const Duration(milliseconds: 200),
                        () => _redirectToLectureSelection());
              },
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 200,
                ),
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/Hazri app icons_Square Snapshot.png')),
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: _isElevatedCamera
                      ? [
                    const BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]
                      : null,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isElevatedDownload = false;
                });
                Timer(const Duration(milliseconds: 200),
                        () => _redirectToDownloadAttendanceScreen());
              },
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 200,
                ),
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/Hazri app icons_Attendance Sheet.png')),
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: _isElevatedDownload
                      ? [
                    const BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
