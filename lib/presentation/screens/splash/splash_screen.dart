import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/core/utils/AppFont.dart';

import 'package:groceryapp/presentation/screens/splash/splash_bloc.dart';
import 'package:groceryapp/presentation/widgets/threedot_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(StartSplash()), // 🔹 Initialize BLoC
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) async{
         if (state is SplashComplete) {
            final prefs = await SharedPreferences.getInstance();
            bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

            if (hasSeenOnboarding) {
              Navigator.pushReplacementNamed(context, '/home'); // ✅ Skip onboarding
            } else {
              Navigator.pushReplacementNamed(context, '/onboarding'); // ✅ Show onboarding
            }
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: BlocBuilder<SplashBloc, SplashState>(
                    builder: (context, state) {
                      return AnimatedOpacity(
                        opacity: state is SplashLoading ? 1.0 : 0.0,
                        duration: const Duration(seconds: 2),
                        child: Image.asset('lib/assets/images/grocery.png', width: 180),
                      );
                    },
                  ),
                ),
              ),

              // Typing Animation for Grocery Text
              DefaultTextStyle(
                style: AppFonts.heading.copyWith(letterSpacing: 3),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'GROCERY',
                      speed: const Duration(milliseconds: 150),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),

              const SizedBox(height: 20),

              // Pulsating Three-Dot Loader
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: ThreeDotLoader(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
