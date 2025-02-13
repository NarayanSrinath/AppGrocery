import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/presentation/screens/onboarding/onboarding_event.dart';
import 'package:groceryapp/presentation/screens/onboarding/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState(currentPage: 0, isLastPage: false)) {
    on<PageChanged>((event, emit) {
      emit(state.copyWith(
        currentPage: event.pageIndex,
        isLastPage: event.pageIndex == 2, // Last page check
      ));
    });

    on<NextPage>((event, emit) {
      if (state.currentPage < 2) {
        emit(state.copyWith(
          currentPage: state.currentPage + 1,
          isLastPage: (state.currentPage + 1) == 2,
        ));
      }
    });
  }
}
