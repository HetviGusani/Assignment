import 'package:flutter/material.dart';

class AppColors {
  // Primary shades (from your palette)
  static const Color primaryLight = Color(0xFFF9ADA0);
  static const Color primary = Color(0xFFF9627D);
  static const Color primaryDark = Color(0xFFC65B7C);

  // Secondary shades
  static const Color secondary = Color(0xFFE05F7D);
  static const Color accent = Color(0xFFF9888F);

  // Deep tones (for text / dark UI)
  static const Color darkPrimary = Color(0xFF91496A);
  static const Color dark = Color(0xFF5B3758);

  // Backgrounds
  static const Color backgroundLight = Color(0xFFFFF5F6);
  static const Color backgroundDark = Color(0xFF2E1A2C);

  // Chat UI specific
  static const Color sentMessage = primary;
  static const Color receivedMessage = Color(0xFFF1F1F1);

  // Text colors
  static const Color textPrimary = Color(0xFF2E1A2C);
  static const Color textSecondary = Color(0xFF6B4A57);
  static const Color textWhite = Colors.white;

  // Status colors
  static const Color online = Colors.green;
  static const Color offline = Colors.grey;
}