import 'package:flutter/material.dart';

import 'counter_display.dart';
import 'increment_button.dart';

class Homepkg extends StatelessWidget {
  Homepkg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterDisplay(),
            SizedBox(height: 20),
            CounterDisplay(), // Same value shown again
          ],
        ),
      ),
      floatingActionButton: IncrementButton(),
    );
  }
}
