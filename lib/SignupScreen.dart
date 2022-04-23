import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'LoginScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool inputError = false;
  String errorMessage = "Error";
  bool passwordObscured = true;
  bool confirmPasswordObscured = true;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signup() async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (newUser != null) {
        Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) => const LoginScreen()));
      }
    }
    catch (e)
    {
      print(e);
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
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
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
                      hintText: 'Password (At least 8 characters)',
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
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: TextField(
                    style: TextStyle(color: Colors.grey[600]),
                    obscureText: confirmPasswordObscured ? true : false,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(32, 179, 86, 1))),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      suffixIcon: IconButton(
                        icon: Icon(
                          confirmPasswordObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            confirmPasswordObscured = !confirmPasswordObscured;
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
                          primary: const Color.fromRGBO(
                              32, 179, 86, 1)), // Background color
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
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
                        } else if (confirmPasswordController.text.isEmpty) {
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
                        } else if (passwordController.text.length < 8) {
                          setState(() {
                            inputError = true;
                            errorMessage =
                                "Password needs to be at least 8 characters long";
                          });
                        } else if (!(confirmPasswordController.text ==
                            passwordController.text)) {
                          setState(() {
                            inputError = true;
                            errorMessage = "Passwords do not match.";
                          });
                        }
                        //TODO: Add account creation here. Check if email is already in use.
                        else {
                          inputError = false;
                          signup();
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
