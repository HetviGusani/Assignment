import 'package:flutter/material.dart';

class first extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Flutter")),
      body: Center(
        child: Text(
          "Hello, World! - Hetvi Gusani",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.red),
        ),
      ),
    );
  }
}
