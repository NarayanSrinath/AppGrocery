import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';




class OnboardingPage extends StatelessWidget {
  final String imagePath;

  final VoidCallback? onNext; // ✅ Callback for button action

  const OnboardingPage({
    super.key,
    required this.imagePath,

    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image (Covers Full Screen)
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fitHeight, // ✅ Ensures full background
              ),
            ),
          ),
        ),

        // Dark overlay for better text visibility
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.3), // ✅ Transparent overlay
          ),
        ),

        // Text & Button
        const Positioned(
          left: 20,
          right: 20,
          bottom: 100, // ✅ Adjust text position above button
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // ✅ Left-align text
          ),
        ),

        // Button at Bottom Left
        Positioned(
          left: 20,
          bottom: 40,
          child: ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Next'),
          ),
        ),
      ],
    );
  }
}
