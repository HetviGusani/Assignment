import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(title: Text("Product Screen"),),
        body: Center(
          child: Text("This is Product Screen"),
        ),
      ),
    );
  }
}
