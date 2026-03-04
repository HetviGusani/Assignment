import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Text(
          "Welcome to Second Screen!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}