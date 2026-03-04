import 'package:flutter/material.dart';

import 'SecondPage.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 600),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SecondScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      // Slide from Right to Left
                      var begin = Offset(1.0, 0.0);
                      var end = Offset.zero;
                      var curve = Curves.easeInOut;

                      var tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
              ),
            );
          },
          child: Text("Go to Second Screen"),
        ),
      ),
    );
  }
}
