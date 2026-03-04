import 'package:flutter/material.dart';

class animatedContainer extends StatefulWidget {
  const animatedContainer({super.key});

  @override
  State<animatedContainer> createState() => _animatedContainerState();
}

class _animatedContainerState extends State<animatedContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedContainer")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(isExpanded ? "Collapse" : "Expand"),
            ),

            const SizedBox(height: 20),

            // Animated Container
            AnimatedContainer(
              decoration: BoxDecoration(color: Colors.blue),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: 250,
              height: isExpanded ? 150 : 0,
              padding: const EdgeInsets.all(16),

              child: isExpanded
                  ? const Text(
                "This is expandable content using AnimatedContainer.",
                style: TextStyle(fontSize: 16),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}