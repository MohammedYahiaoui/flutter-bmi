import 'package:flutter/material.dart';
import 'package:flutter_application_2/colors.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/pages/result.dart';

class Ctrl extends StatefulWidget {
  bool isMale;
  Ctrl({super.key, required this.isMale});

  @override
  State<Ctrl> createState() => _CtrlState();
}

class _CtrlState extends State<Ctrl> {
  int weight = 35;
  int height = 140;
  @override
  Widget build(BuildContext context) {
    Color KMainColor = widget.isMale ? kBlue : kRed;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                    children: [
                      SizedBox(height: 36,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8,),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios_new,
                              color: KMainColor,
                              size: 26,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text("BMI", style: TextStyle(color: KMainColor, fontSize: 26),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.isMale ? "Male" : "Female",
                              style: TextStyle(fontSize: 24),
                              ),
                            Icon(
                              widget.isMale ? Icons.male : Icons.female,
                              color: KMainColor,
                              size: 120,
                              ),
                            Text(
                              "Weight (KG)",
                              style: TextStyle(fontSize: 24),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: 30,
                       itemBuilder: (context, index) {
                         int i = (index + 5) * 5;
                         return Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  weight = i;
                                });
                              },
                              child: Center(
                                child: Text("$i", style: TextStyle(
                                  fontSize: 
                                  weight == i ? 42 : 24, 
                                  color: 
                                  weight == i ? KMainColor : Colors.black),)
                                )
                                ),
                            );
                       },
                      )
                      ),
                    ],
                              ),
                  ),
                )
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration( color: KMainColor),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                    children: [
                    SizedBox(height: 48,),
                    Text(
                      "Height \n (CM)",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                      SizedBox(
                        height: 42,
                      ),
                     Expanded(
                        child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: 30,
                       itemBuilder: (context, index) {
                         int i = (index + 25) * 5;
                         return Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  height = i;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration:  BoxDecoration(
                                  color: height == i ? Colors.white : KMainColor,
                                  borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Text("$i", style: TextStyle(
                                    color: height == i ? KMainColor : Colors.white, fontSize: 20),),
                                  ),
                              ),
                                ),
                            );
                       },
                      ),
                      ), 
                    ],
                              ),
                  ),
                )
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left:  MediaQuery.sizeOf(context).width * 2 / 3 - 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: KYellow, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16,)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  ResultScreen(height: height, weight: weight, isMale: widget.isMale); 
                },));
              },
               child: Row(
                 children: [
                   Text(
                    "Calc".toUpperCase(), 
                    style: TextStyle(fontSize: 22, color: Colors.white),),
                   Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    ),
                 ],
               ))
               ),
        ],
      ),
    );
  }
}