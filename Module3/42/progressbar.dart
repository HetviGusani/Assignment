import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double percentage; // Value between 0.0 to 100.0
  final double height;
  final Color backgroundColor;
  final Color progressColor;

  const ProgressBar({
    super.key,
    required this.percentage,
    this.height = 20,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.progressColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    // Clamp percentage between 0 and 100
    final clampedPercentage = percentage.clamp(0.0, 100.0);

    return Stack(
      children: [
        // Background bar
        Container(
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
        // Foreground (progress) bar
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: height,
          width: MediaQuery.of(context).size.width * (clampedPercentage / 100),
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
        // Optional: Centered text showing percentage
        Positioned.fill(
          child: Center(
            child: Text(
              '${clampedPercentage.toStringAsFixed(0)}%',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}