import 'package:flutter/material.dart';
import 'package:flutter_assignments/42/progressbar.dart';

class ProgressDemo extends StatefulWidget {
  const ProgressDemo({super.key});

  @override
  State<ProgressDemo> createState() => _ProgressDemoState();
}

class _ProgressDemoState extends State<ProgressDemo> {
  double progress = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Progress Bar")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ProgressBar(
              percentage: progress,
              progressColor: Colors.green,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  progress += 10;
                  if (progress > 100) progress = 0;
                });
              },
              child: const Text("Increase Progress"),
            ),
          ],
        ),
      ),
    );
  }
}