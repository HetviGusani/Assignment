import 'package:flutter/material.dart';

class HomeScreenN extends StatefulWidget {
  const HomeScreenN({super.key});

  @override
  State<HomeScreenN> createState() => _HomeScreenNState();
}

class _HomeScreenNState extends State<HomeScreenN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 250,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Details', arguments: "Hetvi");
              },
              child: Text("Details"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Settings', arguments: "Hetvi");
              },
              child: Text("Settings"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
