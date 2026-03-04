import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();

    return Text(
      "Counter: ${counter.count}",
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}
