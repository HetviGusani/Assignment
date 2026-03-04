import 'package:flutter/material.dart';

class SecondScreenN extends StatefulWidget {
  const SecondScreenN({super.key});

  @override
  State<SecondScreenN> createState() => _SecondScreenNState();
}

class _SecondScreenNState extends State<SecondScreenN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen"),),
      body: Center(
        child: Text("Welcome!!!!!!!!!!!!!"),
      ),
    );
  }
}
