import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text(
          generateLuckyNumber(),
          style: TextStyle(
            color: const Color.fromARGB(255, 253, 253, 254),
            fontSize: 40,
          ),
        ),
      ),
    );
  }
  String generateLuckyNumber(){
    var random = Random();
    int luckyNumber = random.nextInt(10);
    return "Your lucky number is $luckyNumber";
  }
}