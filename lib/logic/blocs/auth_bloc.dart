import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

// States
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) => emit(Authenticated()));
    on<LogoutEvent>((event, emit) => emit(Unauthenticated()));
  }
}
