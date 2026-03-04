import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

class IncrementButton extends StatelessWidget {
  IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CounterProvider>().increment();
      },
      child: Icon(Icons.add),
    );
  }
}