import 'package:flutter/material.dart';
import 'package:hazri_mvp_frontend/Timetable.dart';

class EnrollmentScreen extends StatefulWidget {
  const EnrollmentScreen({Key? key}) : super(key: key);

  @override
  State<EnrollmentScreen> createState() => _EnrollmentScreenState();
}

class _EnrollmentScreenState extends State<EnrollmentScreen> {
  TextEditingController classCodeController = TextEditingController();
  bool inputError=false;
  String errorMessage="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 179, 86, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 50),
        child: Column(
          children: [
            
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: TextField(
                            style: TextStyle(color: Colors.grey[600]),
                            controller: classCodeController,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(32, 179, 86, 1))),
                                hintText: 'Class Code',
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        inputError
                            ? Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                          child: Text(
                            errorMessage,
                            style: const TextStyle(
                              color: Color.fromRGBO(239, 83, 80, 1),
                            ),
                          ),
                        )
                            : Container(),
                      ],
                    ),
                  ],
                ),
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
                    'Enroll',
                  ),
                  onPressed: () {
                    //The focus is adjusted so that the keyboard collapses before redirecting to the next screen
                    //That prevents a RenderFlex overflow on the next screen
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      inputError = false;
                    });
                    if (classCodeController.text.isEmpty) {
                      setState(() {
                        inputError = true;
                        errorMessage = "Please enter class code.";
                      });
                    }
                    //TODO: Add Class code check condition here
                    else {
                      inputError = false;
                      Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                               builder: (context) => const Timetable()));
                    }
                  },
                )
            ),
          ],
        ),
      )

    );
  }
}
