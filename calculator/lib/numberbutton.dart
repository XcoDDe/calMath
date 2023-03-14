import 'dart:math';

import 'package:flutter/material.dart';
 
class NumberButtons extends StatelessWidget {
   
  final String number;
  final Function calback;
  const NumberButtons({super.key, required this.number,required this.calback});
 
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: max(40, 0),
      width: max(40, 0),
       
      child: TextButton(
        onPressed: ()=>calback(number),
        style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 93, 108, 119)), 
        child:Text(
          number,
           style: const TextStyle(color: Colors.white,
           fontSize: 25,
           ),
           
           ),
        ),
    ) ;
  }
}