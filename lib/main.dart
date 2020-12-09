import 'dart:ui';

import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

//TODO Correction icon
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //J'applique le theme dark en modifiant quelques parametres
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0C1020),
        scaffoldBackgroundColor: Color(0xff0C1020),
      ),
      home: InputPage(),
    );
  }
}
