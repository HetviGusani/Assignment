import 'package:auth/home.dart';
import 'package:auth/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: pass.text,
    );
    Get.to(HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            children: [
              TextFormField(
                controller: email,
                decoration: InputDecoration(hintText: "Enter Email"),
              ),
              TextFormField(
                controller: pass,
                decoration: InputDecoration(hintText: "Enter Password"),
              ),
              ElevatedButton(
                onPressed: () {
                  signIn();
                },
                child: Text("LogIn"),
              ),
              ElevatedButton(onPressed: () {
                Get.to(Signup());
              }, child: Text("Register Now")),
            ],
          ),
        ),
      ),
    );
  }
}
