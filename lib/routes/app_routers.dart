import 'package:flutter/material.dart';
import 'package:groceryapp/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:groceryapp/presentation/screens/home/home_screen.dart';
import 'package:groceryapp/presentation/screens/onboarding/onboarding_screen.dart';

import 'package:groceryapp/presentation/screens/splash/splash_screen.dart';



class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());
         case '/onboarding': // ✅ Added onboarding route
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

        
        case '/dashboard':
    
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
