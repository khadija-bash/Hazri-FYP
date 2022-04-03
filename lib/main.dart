import 'package:flutter/material.dart';
import 'SplashScreen.dart';

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
//checking commit version control
