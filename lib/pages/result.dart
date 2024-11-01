import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/colors.dart';

class ResultScreen extends StatelessWidget {
  int height;
  int weight;
  bool isMale;
  ResultScreen({super.key, required this.height, required this.weight, required this.isMale});

  @override
  Widget build(BuildContext context) {
     double bmiCalc = weight / pow(height / 100, 2);
     String result = "";
     switch (bmiCalc) {
       case < 16:
         result = "Severe Thinness";
         break;
       case > 16 && < 18.5:
         result = "UnderWeight";  
      case > 18.5 && < 25:
         result = "Normal";
         break;
      case > 25 && < 30:
         result = "OverWeight";   
      case > 30:
       result = "Obese";
       break;         
       default:
     }
    return Scaffold(
      backgroundColor: isMale ? kBlue : kRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "Your Bmi is:",
                  style: TextStyle(color: Colors.white, fontSize: 42),
                  ),
                  SizedBox(
                    height: 40,
                    ),
                Text(
                  "${bmiCalc.toStringAsFixed(1)}",
                  style: TextStyle(color: Colors.white, fontSize: 42),
                  ),
                  SizedBox(
                    height: 40,
                    ),
                 Text(
                  result,
                  style: TextStyle(color: Colors.white, fontSize: 42),
                  ), 
                  SizedBox(
                    height: 40,
                  ),
                  IconButton(onPressed: () {
                   Navigator.pop(context);
                  }, 
                  icon: Icon(
                    Icons.arrow_circle_left, 
                    color: Colors.white,
                    size: 40,)
                    ),  
              ],
            ),
          ),
        ],
      ),
    );
  }
}