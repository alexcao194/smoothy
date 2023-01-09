import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  static const background = Color.fromARGB(255, 34, 30, 42);
  static const track = Color.fromARGB(255, 144, 101, 114);
  static const inActiveTrack = Color.fromARGB(150, 40, 40, 57);
}

class AppGradients {
  const AppGradients._();

  static const background = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.1, 0.9],
    colors: [
      Color.fromARGB(255, 41, 31, 42),
      Color.fromARGB(255, 22, 19, 25),
    ],
  );

}