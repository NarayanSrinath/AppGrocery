import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

// ✅ Bloc States
abstract class HomeState {}

class HomeInitial extends HomeState {}

class EnteringOTP extends HomeState {
  final int timerSeconds;
  final bool isResendEnabled;
  final bool isOTPIncorrect;

  EnteringOTP({
    required this.timerSeconds,
    this.isResendEnabled = false,
    this.isOTPIncorrect = false,
  });
}

class Verified extends HomeState {}

// ✅ Bloc Class
class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeInitial());

  Timer? _otpTimer;
  int _timerSeconds = 30;

  void onContinuePressed() {
    _startOTPTimer();
  }

  void _startOTPTimer() {
    _timerSeconds = 30;
    emit(EnteringOTP(timerSeconds: _timerSeconds));

    _otpTimer?.cancel(); // Cancel previous timer if running
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        _timerSeconds--;
        emit(EnteringOTP(timerSeconds: _timerSeconds));
      } else {
        timer.cancel();
        emit(EnteringOTP(timerSeconds: 0, isResendEnabled: true)); // Enable Resend Button
      }
    });
  }

  void resendOTP() {
    _startOTPTimer(); // Restart timer on resend
  }

 void verifyOTP(String enteredOTP) {
  if (enteredOTP == '1111') {
    _otpTimer?.cancel(); // ✅ Stop the timer when OTP is correct
    emit(Verified()); 
  } else {
    if (state is EnteringOTP) {
      final currentState = state as EnteringOTP;
      emit(EnteringOTP(
        isOTPIncorrect: true,
        timerSeconds: currentState.timerSeconds,
        isResendEnabled: currentState.isResendEnabled,
      ));
    }

    // 🔴 Clear Error After 2 Seconds Without Resetting Timer
    Future.delayed(const Duration(seconds: 2), () {
      if (state is EnteringOTP) {
        final currentState = state as EnteringOTP;
        emit(EnteringOTP(
          timerSeconds: currentState.timerSeconds,
          isResendEnabled: currentState.isResendEnabled,
        ));
      }
    });
  }
}


  @override
  Future<void> close() {
    _otpTimer?.cancel(); // Clean up timer on close
    return super.close();
  }
}
