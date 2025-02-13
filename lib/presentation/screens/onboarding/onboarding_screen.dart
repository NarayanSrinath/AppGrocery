import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/core/utils/AppFont.dart';
import 'package:groceryapp/presentation/screens/onboarding/%20onboarding_bloc.dart';

import 'package:groceryapp/presentation/widgets/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:groceryapp/presentation/screens/onboarding/onboarding_event.dart';
import 'package:groceryapp/presentation/screens/onboarding/onboarding_state.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();
          final PageController controller = PageController(initialPage: state.currentPage);

          return Scaffold(
            body: Stack(
              children: [
                // PageView (Onboarding Pages)
                PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    bloc.add(PageChanged(index)); // Notify bloc when page changes
                  },
                  children: const [
                    OnboardingPage(
                      imagePath: 'lib/assets/images/boardingone.webp',
                      
                    ),
                    OnboardingPage(
                      imagePath: 'lib/assets/images/boardingtwo.webp',
                     
                    ),
                    OnboardingPage(
                      imagePath: 'lib/assets/images/boardingthree.webp',
                     
                    ),
                  ],
                ),

                // SmoothPageIndicator (Top Left Corner)
                Positioned(
                  top: 50,
                  left: 20,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.white,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                ),

                // Title & Description (Bottom Left)
                Positioned(
                  left: 20,
                  right: 100, // Ensures text doesn't overlap with button
                  bottom: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.currentPage == 0
                            ? 'BROWSE THROUGH A WIDE VARIETY OF RESTAURANTS'
                            : state.currentPage == 1
                                ? 'OUR DELIVERY PARTNERS PICK UP YOUR ORDER'
                                : 'ENJOY YOUR MEAL WITH SATISFACTION',
                        style: AppFonts.heading.copyWith(color: AppColors.primary),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.currentPage == 0
                            ? 'With just a few taps, you can easily find and order your favorite dishes.'
                            : state.currentPage == 1
                                ? 'Track your delivery in real-time and enjoy seamless service every step of the way.'
                                : 'Our priority is to provide you with a delightful food experience. Bon appétit!',
                        style: AppFonts.body.copyWith(color: AppColors.secondary),
                      ),
                    ],
                  ),
                ),

          

// Next or Get Started Button (Bottom Right Corner)
Positioned(
  bottom: 40,
  right: 20,
  child: ElevatedButton(
    onPressed: () async {
      if (state.isLastPage) {
        // ✅ Save onboarding completion state
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('hasSeenOnboarding', true);

        // ✅ Navigate to Home screen
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        bloc.add(NextPage());
        controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(state.isLastPage ? 'Get Started' : 'Next', style: AppFonts.body),
  ),
),

              ],
            ),
          );
        },
      ),
    );
  }
}
