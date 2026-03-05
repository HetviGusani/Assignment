import 'package:flutter/material.dart';

import 'Drawer.dart';

class ProfileScreenND extends StatefulWidget {
  const ProfileScreenND({super.key});

  @override
  State<ProfileScreenND> createState() => _ProfileScreenNDState();
}

class _ProfileScreenNDState extends State<ProfileScreenND> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen"),),
      body: Center(child: Text("Profile Screen"),),
      drawer: DrawerD(),
    );
  }
}
