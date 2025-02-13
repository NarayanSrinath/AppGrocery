import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CartEvent {}

class AddItem extends CartEvent {}

class RemoveItem extends CartEvent {}

// States
abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {}

// Bloc
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddItem>((event, emit) => emit(CartUpdated()));
    on<RemoveItem>((event, emit) => emit(CartUpdated()));
  }
}
