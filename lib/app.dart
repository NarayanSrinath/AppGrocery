import 'package:flutter/material.dart';
import 'package:groceryapp/core/config/app_theme.dart';
import 'package:groceryapp/routes/app_routers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Apply custom theme
      initialRoute: '/', // ✅ Always start with splash screen
      onGenerateRoute: AppRouter.generateRoute, // ✅ Ensure correct routing
    );
  }
}
