import 'package:flutter/material.dart';
import 'package:flutter_assignments/21/Second.dart';

class FirstScreenN extends StatefulWidget {
  const FirstScreenN({super.key});

  @override
  State<FirstScreenN> createState() => _FirstScreenNState();
}

class _FirstScreenNState extends State<FirstScreenN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen"),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SecondScreenN()));
        }, child: Text("Second Screen")),
      ),
    );
  }
}
