import 'package:flutter/material.dart';

class CardEx extends StatelessWidget {
  const CardEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card UI Example"),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Card Widget
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: 300,
                height: 180,
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "This is a simple card design using Stack and Positioned widget.",
                    ),
                  ],
                ),
              ),
            ),

            // Floating Action Button Positioned
            Positioned(
              bottom: -20,
              right: -20,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}