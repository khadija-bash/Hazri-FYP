import 'package:flutter/material.dart';
import 'LectureSelection.dart';
import 'DownloadAttendance.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isElevatedCamera = true, _isElevatedDownload = true;

  Future<void> _redirectToLectureSelection() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LectureSelection()));

    //Reset the button that was just used
    setState(() {
      _isElevatedCamera = true;
    });
  }

  void _redirectToDownloadAttendanceScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DownloadAttendance()));

    //Reset the button that was just used
    setState(() {
      _isElevatedDownload = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
