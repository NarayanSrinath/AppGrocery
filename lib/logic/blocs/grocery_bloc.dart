import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class GroceryEvent {}

class FetchGroceries extends GroceryEvent {}

// States
abstract class GroceryState {}

class GroceryInitial extends GroceryState {}

class GroceryLoaded extends GroceryState {}

// Bloc
class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryInitial()) {
    on<FetchGroceries>((event, emit) => emit(GroceryLoaded()));
  }
}
