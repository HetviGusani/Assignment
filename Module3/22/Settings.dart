import 'package:flutter/material.dart';

class SettingsScreenN extends StatefulWidget {
  const SettingsScreenN({super.key});

  @override
  State<SettingsScreenN> createState() => _SettingsScreenNState();
}

class _SettingsScreenNState extends State<SettingsScreenN> {
  late final String text = ModalRoute.of(context)!.settings.arguments as String;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Settings Screen")),
        body: Center(child: Text("Welcome $text This is Settings Screen")),
      ),
    );
  }
}
