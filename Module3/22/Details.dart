import 'package:flutter/material.dart';

class DetailsScreenN extends StatefulWidget {
  const DetailsScreenN({super.key});

  @override
  State<DetailsScreenN> createState() => _DetailsScreenNState();
}

class _DetailsScreenNState extends State<DetailsScreenN> {
  late final String text = ModalRoute.of(context)!.settings.arguments as String;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Details Screen")),
        body: Center(child: Text("Welcome $text This is Detiails Screen")),
      ),
    );
  }
}
