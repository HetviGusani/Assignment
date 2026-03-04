import 'package:flutter/material.dart';

class PulsingButton extends StatefulWidget {
  const PulsingButton({super.key});

  @override
  State<PulsingButton> createState() => _PulsingButtonState();
}

class _PulsingButtonState extends State<PulsingButton> {
  bool isBig = false;

  @override
  void initState() {
    super.initState();
    _startPulse();
  }

  void _startPulse() async {
    while (mounted) {
      await Future.delayed(const Duration(milliseconds: 800));
      setState(() {
        isBig = !isBig;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pulsing Button")),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 100,
            end: isBig ? 130 : 100,
          ),
          duration: const Duration(milliseconds: 800),
          builder: (context, value, child) {
            return SizedBox(
              width: value,
              height: value,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Tap Me"),
              ),
            );
          },
        ),
      ),
    );
  }
}