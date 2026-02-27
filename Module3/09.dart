import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

String input = "";
String result = "";

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<String> buttons = [
    "AC",
    "⌫",
    "C",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "%",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Display Screen
            SizedBox(height: 40),
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              height: 125,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Text(input, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Buttons Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        onButtonPressed(buttons[index]);
                        print("${buttons[index]} pressed");
                      },
                      child: Text(
                        buttons[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onButtonPressed(String button) {
    setState(() {
      if (button == "AC") {
        input = "";
        result = "0";
      } else if (button == "⌫") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (button == "=") {
        try {
          result = calculate(input);
        } catch (e) {
          result = "Error";
        }
      } else {
        input += button;
      }
    });
  }

  String calculate(String input) {
    try {
      // Convert percentage (example: 50% → (50/100))
      input = input.replaceAllMapped(
        RegExp(r'(\d+)%'),
        (match) => '(${match.group(1)}/100)',
      );

      Parser p = Parser();
      Expression exp = p.parse(input);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Remove unnecessary decimal
      if (eval % 1 == 0) {
        return eval.toInt().toString();
      } else {
        return eval.toString();
      }
    } catch (e) {
      return "Error";
    }
  }
}
