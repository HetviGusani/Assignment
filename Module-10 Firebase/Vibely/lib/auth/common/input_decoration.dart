import 'package:flutter/material.dart';

import '../../others/colors.dart';

InputDecoration commonInputDecoration({
  required String hint,
  required IconData icon,
  bool isPassword = false,
  bool obscureText = false,
  VoidCallback? onToggle,
}) {
  return InputDecoration(
    hintText: hint,
    contentPadding: EdgeInsets.symmetric(vertical: 16),
    hintStyle: TextStyle(color: AppColors.textSecondary),
    prefixIcon: Icon(icon, color: AppColors.primary),

    filled: true,
    fillColor: AppColors.backgroundLight,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primaryLight),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primaryLight),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    ),

    suffixIcon: isPassword
        ? IconButton(
      icon: Icon(
        obscureText ? Icons.visibility_off : Icons.visibility,
        color: AppColors.primary,
      ),
      onPressed: onToggle,
    )
        : null,
  );
}