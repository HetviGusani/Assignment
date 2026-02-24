import 'package:flutter/material.dart';

class TwoTextWidget extends StatefulWidget {
  const TwoTextWidget({super.key});

  @override
  State<TwoTextWidget> createState() => _TwoTextWidgetState();
}

class _TwoTextWidgetState extends State<TwoTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Two Text Widgets")),
      body: Center(
        child: Column(
          children: [
            Text(
              "First",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Colors.red,
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Second",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.green,
                backgroundColor: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
