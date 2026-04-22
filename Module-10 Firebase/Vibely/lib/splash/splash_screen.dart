import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/login.dart';
import '../home/HomeScreen.dart';
import '../others/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _animation = Tween<double>(
      begin: 0,
      end: -20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Loop animation (jump up-down)
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();

    _checkInternetAndProceed();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryLight,
              AppColors.primary,
              AppColors.darkPrimary,
              AppColors.dark,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔥 LOGO
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),

            SizedBox(height: 20),

            // ✨ APP NAME
            Text(
              "Vybely", // change if needed
              style: GoogleFonts.exo2(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),

            SizedBox(height: 12),

            Text(
              "Connect your vibe  💬",
              style: GoogleFonts.dancingScript(
                fontSize: 22,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 40),

            // ⏳ LOADING
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }

  Future<void> _checkInternetAndProceed() async {
    final List<ConnectivityResult> result =
    await Connectivity().checkConnectivity();

    final bool isConnected =
        result.isNotEmpty && result.any((r) => r != ConnectivityResult.none);

    if (!isConnected) {
      if (mounted) _showNoInternetDialog();
      return;
    }

    await _checkLoginAndNavigate();
  }
  Future<void> _checkLoginAndNavigate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final String name = prefs.getString('userName') ?? '';
    final String email = prefs.getString('userEmail') ?? '';

    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => isLoggedIn
              ? HomeScreen(name: name, email: email)
              : const Login(),
        ),
      );
    }
  }

  // ─── No Internet Dialog ───────────────────────────────────────────────────

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.wifi_off, color: AppColors.primary, size: 50),
                const SizedBox(height: 15),
                const Text(
                  "No Internet Connection",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Please check your connection and try again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    /// RETRY
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.of(dialogContext).pop(); // close dialog first
                          await Future.delayed(
                            const Duration(milliseconds: 300),
                          );
                          _checkInternetAndProceed(); // retry
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Retry"),
                      ),
                    ),
                    const SizedBox(width: 10),

                    /// CLOSE
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Close"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
