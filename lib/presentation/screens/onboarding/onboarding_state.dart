import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentPage;
  final bool isLastPage;

  const OnboardingState({required this.currentPage, required this.isLastPage});

  OnboardingState copyWith({int? currentPage, bool? isLastPage}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  List<Object?> get props => [currentPage, isLastPage];
}
