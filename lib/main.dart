import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/control.dart';
import 'package:flutter_application_2/pages/home_page.dart';

void main() {
  runApp(BmiPlus());
}

class BmiPlus extends StatelessWidget {
  const BmiPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}