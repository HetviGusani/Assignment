import 'package:flutter/material.dart';

class stack1 extends StatefulWidget {
  const stack1({super.key});

  @override
  State<stack1> createState() => _stack1State();
}

class _stack1State extends State<stack1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack"),),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [

            // Image
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Transparent Overlay
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            // Text on top
            const Text(
              "Beautiful Nature",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
