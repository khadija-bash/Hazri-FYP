import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'CameraScreen.dart';

class Lecture<T1, T2> {
  final T1 lectureName;
  final T2 lectureTime;

  Lecture(this.lectureName, this.lectureTime);
}

class Timetable extends StatefulWidget {
  const Timetable({Key? key}) : super(key: key);

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  final List<Lecture<String, String>> _lectures = <Lecture<String, String>>[];

  void initState() {
    super.initState();
    _lectures.addAll(
        [Lecture("DB-A", "8:30-10:00"), Lecture("OOP-A", "12:00-1:30"), Lecture("OS-B", "3:30-5:00")]);
  }

  Future<void> _redirectToCameraScreen() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraScreen(camera: firstCamera)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(32, 179, 86, 1),
        ),
        body: _buildLecturesList());
  }

  Widget _buildLecturesList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2 *
          (_lectures
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

        return _buildRow(_lectures[index]);
      },
    );
  }

  Widget _buildRow(Lecture<String, String> lecture) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(32, 179, 86, 1),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        title: Text(
          lecture.lectureName,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          lecture.lectureTime,
        ),
        trailing: Container(
          height: 55,
          width: 55,
          child: IconButton(
            icon: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              child: Image.asset(
                'assets/Hazri app icons_Square Snapshot.png',
                fit: BoxFit.contain,
                height: 170,
              )
            ),
            onPressed: () {
              //TODO: Pass class or attendance ID as arguments
              _redirectToCameraScreen();
            },
          ),
        ),
      ),
    );
  }
}
