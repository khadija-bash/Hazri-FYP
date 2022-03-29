import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//
//
//MAIN
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: const SplashScreen(),
    ),
  );
}
//
//
//
//
//
//
//
//
//
//
//
//SPLASH SCREEN
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(32, 179, 86, 1),
        child: Image.asset('assets/Hazri logo_Green Background.png'));
  }
}
//
//
//
//
//
//
//
//
//
//
//
//LOGIN
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(50),
                    child: Image.asset(
                      'assets/Hazri logo_Standard.png',
                      fit: BoxFit.contain,
                      height: 170,
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    style: const TextStyle(color: Colors.grey),
                    controller: nameController,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 179, 86, 1))),
                        hintText: 'User Name',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: TextField(
                    style: const TextStyle(color: Colors.grey),
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 179, 86, 1))),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(32, 179, 86, 1),
                          onPrimary: Colors.grey[300]), // Background color
                      child: const Text(
                        'Login',
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: const Color.fromRGBO(32, 179, 86, 1)),
                        child: const Text(
                          'Sign Up',
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            )));
  }
}
//
//
//
//
//
//
//
//
//
//
//
// SIGNUP
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(50),
                    child: Image.asset(
                      'assets/Hazri logo_Standard.png',
                      fit: BoxFit.contain,
                      height: 170,
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    style: const TextStyle(color: Colors.grey),
                    controller: nameController,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 179, 86, 1))),
                        hintText: 'User Name',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    style: const TextStyle(color: Colors.grey),
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 179, 86, 1))),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: TextField(
                    style: const TextStyle(color: Colors.grey),
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 179, 86, 1))),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(
                              32, 179, 86, 1)), // Background color
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: const Color.fromRGBO(32, 179, 86, 1)),
                        child: const Text(
                          'Login',
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            )));
  }
}
//
//
//
//
//
//
//
//
//
//
//
//HOMEPAGE
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
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 179, 86, 1),
      ),
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
//
//
//
//
//
//
//
//
//
//
//
//DOWNLOAD ATTENDANCE SCREEN
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
    // TODO: implement initState
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
//
//
//
//
//
//
//
//
//
//
//
//LECTURE SELECTION
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
    // TODO: implement initState
    super.initState();
    dropdownValuesList = ['DB-A', 'DB-B', 'OOP-A', 'OOP-B'];
    dropdownValue = dropdownValuesList.first;
    dateNow=DateFormat('yMd').format(now);
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
              Text(dateNow, style: const TextStyle(color: Colors.grey, fontSize: 35),),
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
//
//
//
//
//
//
//
//
//
//
// CAMERA SCREEN
class CameraScreen extends StatefulWidget {
  const CameraScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int _photoCountdown = 3;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.ultraHigh,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final mediaSize = MediaQuery.of(context).size;
            final scale =
                1 / (_controller.value.aspectRatio * mediaSize.aspectRatio);
            return ClipRect(
              clipper: _MediaSizeClipper(mediaSize),
              child: Transform.scale(
                scale: scale,
                alignment: Alignment.topCenter,
                child: CameraPreview(_controller),
              ),
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 200,
        width: 200,
        child: FittedBox(
          child: FloatingActionButton(
            // Provide an onPressed callback.
            onPressed: () async {
              // Take the Picture in a try / catch block. If anything goes wrong,
              // catch the error.
              try {
                // Ensure that the camera is initialized.
                await _initializeControllerFuture;

                // Attempt to take a picture and get the file `image`
                // where it was saved.
                final image = await _controller.takePicture();

                setState(() {
                  _photoCountdown--;
                });

                if (_photoCountdown < 1) {
                  await Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const AttendanceList()));
                }
                /*
                // If the picture was taken, display it on a new screen.
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayPictureScreen(
                      // Pass the automatically generated path to
                      // the DisplayPictureScreen widget.
                      imagePath: image.path,
                    ),
                  ),
                );
                */
              } catch (e) {
                if (kDebugMode) {
                  print(e);
                }
              }
            },
            child: _photoCountdown == 3
                ? Image.asset('assets/Hazri app icons_3 Square Snapshot.png')
                : _photoCountdown == 2
                ? Image.asset(
                'assets/Hazri app icons_2 Square Snapshot.png')
                : Image.asset(
                'assets/Hazri app icons_1 Square Snapshot.png'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

//CAMERA SCREEN: HELPING CLASS
class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
//
//
//
//
//
//
//
//
//
//
//
//DISPLAY PICTURE
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      backgroundColor: Colors.white,
      body: Image.file(File(imagePath)),
    );
  }
}
//
//
//
//
//
//
//
//
//
//
//ATTENDANCE LIST
class AttendanceList extends StatefulWidget {
  const AttendanceList({Key? key}) : super(key: key);

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  final List<String> _studentsList =<String>[];
  final List<String> _presentList = <String>[];
  final List<String> _absentList = <String>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _absentList.addAll(["Haider Zia", "Khadija Bashir"]);
    _presentList.addAll(["Rabbia Sajjad"]);
    _studentsList.addAll(_absentList);
    _studentsList.addAll(_presentList);
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold (backgroundColor: Colors.grey[300],
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
      itemCount: 2*(_studentsList.length), // Sending 2x the item count because we are also using a divider at every alternate index. E.g 2 names, 2 dividers, 4 total items
      itemBuilder: (context, i) {
        if (i.isOdd) {
          //indent added to make divider line disappear. Changing color and thickness didn't work well.
          return const Divider( indent: 200, endIndent: 200,);
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
          color: present? const Color.fromRGBO(32, 179, 86, 1): Colors.red[400],
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
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
                borderRadius: const BorderRadius.all(Radius.circular(7))
            ),
            child: Icon(
              present ? Icons.clear_rounded : Icons.check_rounded,
              color: present
                  ?Colors.red[400]
                  :const Color.fromRGBO(32, 179, 86, 1),
              semanticLabel: present ? 'Mark Absent' : 'Mark Present',
            ),
          ),
          onPressed: () {      // NEW lines from here...
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
  void _confirmAttendance(){
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}

