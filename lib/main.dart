import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/app.dart';
import 'package:groceryapp/dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: DependencyInjection.getBlocProviders(), // Register BLoC providers
      child: const App(), // ✅ Now matches updated App.dart
    );
  }
}
