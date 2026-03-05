import 'package:flutter/material.dart';

import 'Drawer.dart';

class HomeScreenND extends StatefulWidget {
  const HomeScreenND({super.key});

  @override
  State<HomeScreenND> createState() => _HomeScreenNDState();
}

class _HomeScreenNDState extends State<HomeScreenND> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),),
      body: Center(child: Text("Home Screen"),),
      drawer: DrawerD(),
    );
  }
}
