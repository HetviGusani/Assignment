import 'package:flutter/material.dart';

import 'Drawer.dart';

class SettingScreenND extends StatefulWidget {
  const SettingScreenND({super.key});

  @override
  State<SettingScreenND> createState() => _SettingScreenNDState();
}

class _SettingScreenNDState extends State<SettingScreenND> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting Screen"),),
      body: Center(child: Text("Setting Screen"),),
      drawer: DrawerD(),);
  }
}
