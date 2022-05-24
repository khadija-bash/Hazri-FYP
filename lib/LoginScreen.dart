import 'package:flutter/material.dart';
import 'package:hazri_mvp_frontend/HomePage.dart';
import 'SignupScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool inputError = false;
  String errorMessage = "Error";
  bool passwordObscured = true;
  final _auth = FirebaseAuth.instance;

  Future login() async {
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (newUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

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
                    style: TextStyle(color: Colors.grey[600]),
                    controller: emailController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 179, 86, 1))),
                        hintText: 'Email Address',
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: TextField(
                    style: TextStyle(color: Colors.grey[600]),
                    obscureText: passwordObscured ? true : false,
                    controller: passwordController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(32, 179, 86, 1))),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordObscured = !passwordObscured;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                inputError
                    ? Container(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                        child: Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Color.fromRGBO(239, 83, 80, 1),
                          ),
                        ),
                      )
                    : Container(),
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
                        //The focus is adjusted so that the keyboard collapses before redirecting to the next screen
                        //That prevents a RenderFlex overflow on the next screen
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        setState(() {
                          inputError = false;
                        });
                        if (emailController.text.isEmpty) {
                          setState(() {
                            inputError = true;
                            errorMessage = "Please fill all input fields.";
                          });
                        } else if (passwordController.text.isEmpty) {
                          setState(() {
                            inputError = true;
                            errorMessage = "Please fill all input fields.";
                          });
                        } else if (!EmailValidator.validate(
                            emailController.text)) {
                          setState(() {
                            inputError = true;
                            errorMessage =
                                "Please enter a valid email address.";
                          });
                        }
                        //TODO: Add Email and Password combination check condition here
                        else {
                          inputError = false;
                          try{
                            login();
                          }catch(e){
                            inputError=true;
                            errorMessage="Email or password is incorrect";
                          }
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()));
                        }
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
