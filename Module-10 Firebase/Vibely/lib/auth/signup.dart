import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../auth/common/header.dart';
import '../others/colors.dart';
import 'common/input_decoration.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  bool _obscureText = true;
  bool _isLoading = false;
  bool _isGoogleLoading = false;

  final String _emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('Users');

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        /// 🌈 SAME GRADIENT AS LOGIN
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
                children: [

                  /// 🔥 COMMON HEADER
                  AuthHeader(
                    title: "Create Account 🚀",
                    subtitle: "Sign up to get started",
                  ),

                  /// 🧾 CARD (SAME AS LOGIN)
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

                            /// NAME
                            TextFormField(
                              controller: name,
                              decoration: commonInputDecoration(
                                hint: "Enter Name",
                                icon: Icons.person,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your name";
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 15),

                            /// EMAIL
                            TextFormField(
                              controller: email,
                              decoration: commonInputDecoration(
                                hint: "Enter Email",
                                icon: Icons.mail,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter email";
                                } else if (!RegExp(_emailPattern)
                                    .hasMatch(value)) {
                                  return "Invalid email";
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

                            /// 🚀 SIGNUP BUTTON (GRADIENT SAME AS LOGIN)
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
                                    : _handleSignUp,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),

                                child: _isLoading
                                    ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child:
                                  CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                                    : const Text(
                                  "Sign Up",
                                  style: TextStyle(
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
                                  child: Divider(
                                      color: AppColors.primaryLight),
                                ),
                                const Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  child: Text("OR"),
                                ),
                                Expanded(
                                  child: Divider(
                                      color: AppColors.primaryLight),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),

                            /// GOOGLE BUTTON (MATCHED)
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: OutlinedButton.icon(
                                onPressed: _isGoogleLoading
                                    ? null
                                    : _handleGoogleSignIn,
                                icon: Image.asset(
                                  'assets/images/google.png',
                                  height: 22,
                                ),
                                label: const Text(
                                  "Continue with Google",
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: AppColors.primaryLight),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(12),
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

                  /// LOGIN LINK (MATCHED STYLE)
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style:
                      TextStyle(color: AppColors.textSecondary),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Login()),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔐 HANDLERS

  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await _signUpWithEmail();
    if (mounted) setState(() => _isLoading = false);
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() => _isGoogleLoading = true);
    await _signInWithGoogle();
    if (mounted) setState(() => _isGoogleLoading = false);
  }

  /// 🔐 AUTH LOGIC (UNCHANGED)

  Future<void> _signUpWithEmail() async {
    String hashedPass = hashPassword(pass.text);

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: pass.text.trim(),
      );

      await _usersCollection.doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'name': name.text.trim(),
        'email': email.text.trim(),
        'password': hashedPass,
        'createdAt': FieldValue.serverTimestamp(),
      });

      _clearFields();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created!")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Login()),
      );

    } on FirebaseAuthException catch (e) {  // ✅ Catch Firebase specific errors

      String message = "";

      switch (e.code) {
        case 'email-already-in-use':
          message = "Account already exists with this email!";  // ✅ Your case
          break;
        case 'invalid-email':
          message = "Invalid email address!";
          break;
        case 'weak-password':
          message = "Password is too weak!";
          break;
        case 'network-request-failed':
          message = "No internet connection!";
          break;
        default:
          message = "Error: ${e.message}";
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,  // ✅ Red color for errors
        ),
      );

    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return; // user cancelled

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken!,
        idToken: googleAuth.idToken!,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user == null) return;

      final query = await _usersCollection
          .where('email', isEqualTo: user.email)
          .get();

      if (query.docs.isNotEmpty) {
        /// ⚠️ Email already registered → show snackbar
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Email already registered")),
          );
        }
        return;
      }


      // Only create Firestore doc if this is a new user
      await _usersCollection.doc(user.uid).set({
        'uid': user.uid,
        'name': user.displayName ?? '',
        'email': user.email ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Google Sign-In Successful!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>Login()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Google Sign-In failed. Try again.")),
        );
      }
    }
  }

  void _clearFields() {
    name.clear();
    email.clear();
    pass.clear();
  }

  String hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }
}