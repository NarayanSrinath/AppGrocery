import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// When user swipes to a new page
class PageChanged extends OnboardingEvent {
  final int pageIndex;

  PageChanged(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

// When user taps "Next" button
class NextPage extends OnboardingEvent {}

// When user taps "Get Started"
class CompleteOnboarding extends OnboardingEvent {}
