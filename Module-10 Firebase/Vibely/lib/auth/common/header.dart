import 'package:flutter/material.dart';
import '../../others/colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),

        /// 🚗 LOGO
        Image.asset(
          "assets/images/logo_bg.png",
          height: 70,
        ),

        const SizedBox(height: 10),

        /// TITLE
        Text(
          title,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.darkPrimary,
          ),
        ),

        const SizedBox(height: 5),

        /// SUBTITLE
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}