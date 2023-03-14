// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:calculator/calculations.dart';
import 'package:calculator/numberbutton.dart';
import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyCalculator());
}

/*void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyCalculator(),
    ),
  );
}*/

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String textInputDisplay = '0';
  String textAnswerDisplay = '0';
  String tempInputDisplay = '';
  double fontSize=15;
  btnclick(String btn) {
    if (btn == '=') {
      var n = Calculations(inputValues: textInputDisplay);
      n.calEngine();
      setState(() {
        textAnswerDisplay = n.calAnswer();
      });
    } else if (btn == 'AC') {
      setState(() {
        textInputDisplay = '0';
        textAnswerDisplay='0';
      });
    } else if (btn == '<') {
      tempInputDisplay =
          textInputDisplay.substring(0, textInputDisplay.length - 1);
      if (tempInputDisplay.isEmpty) {
        setState(() {
          textInputDisplay = '0';
        });
      }
       else {
        if(textInputDisplay.length<50){
            fontSize=25;
          }else if(textInputDisplay.length<80){
            fontSize=20;
          }
        setState(() {
          textInputDisplay = tempInputDisplay;
        });
      }
    } else {
      if (textInputDisplay == '0') {
        textInputDisplay = '';
      }
      if(textInputDisplay.length>50){
        fontSize=20;
      }else
      if(textInputDisplay.length==80){
        fontSize=20;
      }
       
      
      setState(() {
        if(textInputDisplay.length<100) {
          textInputDisplay += btn;
        }
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('CalMath'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                   
                  padding: EdgeInsets.all(17.0),
                  alignment: Alignment.topRight,
                  child: Text(
                    textInputDisplay,
                    style: TextStyle(
                        fontSize: fontSize, color: Color.fromARGB(255, 116, 113, 113)),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.all(17.0),
                  alignment: Alignment.topRight,
                  child: Text(
                    textAnswerDisplay,
                    style: TextStyle(fontSize: 20),
                  ),
                ), 
                SizedBox(
                  height: 10, 
                ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 16, 5),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NumberButtons(number: '=', calback: btnclick),
                    ],
                                 ),
                 ),
                  
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberButtons(number: '0', calback: btnclick),
                    NumberButtons(number: '(', calback: btnclick),
                    NumberButtons(number: ')', calback: btnclick),
                    NumberButtons(number: 'AC', calback: btnclick),
                    NumberButtons(number: '<', calback: btnclick),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberButtons(number: '1', calback: btnclick),
                    NumberButtons(number: '2', calback: btnclick),
                    NumberButtons(number: '3', calback: btnclick),
                    NumberButtons(number: '+', calback: btnclick),
                    NumberButtons(number: '-', calback: btnclick),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberButtons(number: '4', calback: btnclick),
                    NumberButtons(number: '5', calback: btnclick),
                    NumberButtons(number: '6', calback: btnclick),
                    NumberButtons(number: '*', calback: btnclick),
                    NumberButtons(number: '/', calback: btnclick),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberButtons(number: '7', calback: btnclick),
                    NumberButtons(number: '8', calback: btnclick),
                    NumberButtons(number: '9', calback: btnclick),
                    NumberButtons(number: '^', calback: btnclick),
                    NumberButtons(number: '.', calback: btnclick),
                  
                  ],
                               ),
                 
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
