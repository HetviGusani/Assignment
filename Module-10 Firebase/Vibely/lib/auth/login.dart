import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibely/auth/common/header.dart';
import 'package:vibely/auth/signup.dart';
import '../home/HomeScreen.dart';
import '../others/colors.dart';
import 'common/input_decoration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  bool _isLoading = false;
  bool _obscureText = true;

  final String _emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryLight.withOpacity(0.4),
              AppColors.backgroundLight,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthHeader(
                    title: "Welcome Back 👋",
                    subtitle: "Login to continue",
                  ),

                  /// 🧾 CARD
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primaryLight.withOpacity(0.5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, -6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 15),

                            /// EMAIL
                            TextFormField(
                              controller: email,
                              decoration: commonInputDecoration(
                                hint: "Enter Email",
                                icon: Icons.mail,
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter your email";
                                } else if (!RegExp(
                                  _emailPattern,
                                ).hasMatch(value.trim())) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 15),

                            /// PASSWORD
                            TextFormField(
                              controller: pass,
                              obscureText: _obscureText,
                              decoration: commonInputDecoration(
                                hint: "Enter Password",
                                icon: Icons.lock,
                                isPassword: true,
                                obscureText: _obscureText,
                                onToggle: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter password";
                                } else if (value.length < 6) {
                                  return "Min 6 characters";
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 25),

                            /// LOGIN BUTTON
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.secondary,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton(
                                onPressed: _isLoading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() => _isLoading = true);

                                          Future.delayed(
                                            const Duration(seconds: 2),
                                            () {
                                              loginUser();
                                            },
                                          );
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: _isLoading
                                    ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        "Log In",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            /// DIVIDER
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(color: AppColors.primaryLight),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text("OR"),
                                ),
                                Expanded(
                                  child: Divider(color: AppColors.primaryLight),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),

                            /// GOOGLE BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: OutlinedButton.icon(
                                onPressed: () {logInWithGoogle();},
                                icon: Image.asset(
                                  'assets/images/google.png',
                                  height: 22,
                                ),
                                label: Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: AppColors.primaryLight,
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// SIGNUP LINK
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    setState(() => _isLoading = true);

    try {
      String enteredEmail = email.text.trim();
      String enteredPassword = pass.text.trim();

      // ✅ Sign in with Firebase Auth
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: enteredEmail,
        password: enteredPassword,
      );

      // ✅ Get user data from Firestore
      final doc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.uid)
          .get();

      if (!doc.exists) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not found.')),
        );
        return;
      }

      String uname = doc['name'];

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool('isLoggedIn', true);
      await pref.setString('userName', uname);
      await pref.setString('userEmail', enteredEmail);

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(name: uname, email: enteredEmail),
        ),
      );

    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      String message = switch (e.code) {
        'user-not-found' => 'No account found with this email.',
        'wrong-password' => 'Incorrect password.',
        'invalid-credential' => 'Invalid email or password.',
        'network-request-failed' => 'No internet connection.',
        _ => 'Error: ${e.message}',
      };
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );

    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );

    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
  String hashPassword(String password) {
    final bytes = utf8.encode(password.trim());
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  Future<void> logInWithGoogle() async {
    try {
      setState(() => _isLoading = true);

      final GoogleSignInAccount? googleUser =
      await GoogleSignIn().signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final user = userCredential.user;
      if (user == null) return;

      /// 🔍 Check in Firestore
      final doc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();

      if (!doc.exists) {
        /// ❌ User NOT registered → logout
        await FirebaseAuth.instance.signOut();
        await GoogleSignIn().signOut();

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account not registered. Please sign up first.")),
        );

        return;
      }

      /// ✅ User exists → login allowed
      String uname = doc['name'];
      String uemail = doc['email'];

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool('isLoggedIn', true);
      await pref.setString('userName', uname);
      await pref.setString('userEmail', uemail);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(name: uname, email: uemail),
        ),
      );

    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
