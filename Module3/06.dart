import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Card")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              SizedBox(height: 90,),
              CircleAvatar(radius: 50.0,backgroundColor: Colors.teal,backgroundImage: AssetImage("assets/img.png"),),
              SizedBox(height: 30),
              Text(
                "Hetvi Gusani",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 30),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Creative coder & problem solver"),
                    SizedBox(height: 10),
                    Text("Java | Flutter | SQL"),
                    SizedBox(height: 10),
                    Text(" Dreaming big, coding bigger 🚀"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
