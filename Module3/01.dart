import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  const Textwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First",),),
      body: Center(
        child: Text("Hello, Flutter!"),
      ),
    );
  }
}
