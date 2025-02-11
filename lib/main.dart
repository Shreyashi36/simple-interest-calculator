import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screens/first_screen.dart';

void main() => runApp(MyFlutter());

class MyFlutter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My flutter app",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My first flutter app")),
        body: FirstScreen()
      ),
    );
  }
}