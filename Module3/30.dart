import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        centerTitle: true,
      ),
      body: Stack(
        children: [

          Positioned(
            top: 120,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/img.png")
            ),
          ),

          Positioned.fill(
            top: 250,
            child: Column(
              children: const [
                SizedBox(height: 40),
                Text(
                  "Hetvi Gusani",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Flutter Developer | Passionate about UI Design and Mobile App Development",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}