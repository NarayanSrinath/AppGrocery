import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🔹 Events for SplashBloc
abstract class SplashEvent {}

class StartSplash extends SplashEvent {}

// 🔹 States for SplashBloc
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashComplete extends SplashState {}

// 🔹 Bloc Implementation
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<StartSplash>((event, emit) async {
      emit(SplashLoading());
      await Future.delayed(const Duration(seconds: 5)); // Simulating delay
      emit(SplashComplete());
    });
  }
}
