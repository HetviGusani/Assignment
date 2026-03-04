import 'package:flutter/material.dart';
import 'package:flutter_assignments/23/Home.dart';
import 'package:flutter_assignments/23/Setting.dart';

import 'Profile.dart';

class DrawerD extends StatefulWidget {
  const DrawerD({super.key});

  @override
  State<DrawerD> createState() => _DrawerDState();
}

class _DrawerDState extends State<DrawerD> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text("Hetvi Gusani"), accountEmail: Text("hgusani05@gmail.com")),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreenND()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreenND()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreenND()),
                );
              },
            ),
          ],
        ),

    );
  }
}
