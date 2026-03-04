import 'package:flutter/material.dart';

class CustomRating extends StatefulWidget {
  const CustomRating({super.key});

  @override
  State<CustomRating> createState() => _CustomRatingState();
}

class _CustomRatingState extends State<CustomRating> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Rating")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                Icons.star,
                size: 40,
                color: index < selectedRating
                    ? Colors.orange
                    : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  selectedRating = index + 1;
                });
              },
            );
          }),
        ),
      ),
    );
  }
}