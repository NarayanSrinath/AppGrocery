import 'package:flutter/material.dart';

import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/core/utils/AppFont.dart';


class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: AppColors.white), // ✅ Use AppColors
        label: Text(text, style: AppFonts.button), // ✅ Use AppFonts
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary, // ✅ Primary color for button
          foregroundColor: AppColors.white, // ✅ White text/icons
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
