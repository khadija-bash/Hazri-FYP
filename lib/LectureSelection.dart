import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:camera/camera.dart';
import 'CameraScreen.dart';

class LectureSelection extends StatefulWidget {
  const LectureSelection({Key? key}) : super(key: key);

  @override
  State<LectureSelection> createState() => _LectureSelectionState();
}

class _LectureSelectionState extends State<LectureSelection> {
  List<String> dropdownValuesList = [];
  String dropdownValue = '';
  final now = DateTime.now();
  String dateNow = '';

  @override
  void initState() {
    super.initState();
    dropdownValuesList = ['DB-A', 'DB-B', 'OOP-A', 'OOP-B'];
    dropdownValue = dropdownValuesList.first;
    dateNow = DateFormat('yMd').format(now);
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
              Text(
                dateNow,
                style: const TextStyle(color: Colors.grey, fontSize: 35),
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _redirectToCameraScreen();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(32, 179, 86, 1),
                      onPrimary: Colors.grey[300]), // Background color
                  child: const Text(
                    'Mark Attendance',
                  ),
                ),
              )
            ],
          )),
    );
  }
}
