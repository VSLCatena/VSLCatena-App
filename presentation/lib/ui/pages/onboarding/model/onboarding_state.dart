sealed class OnboardingState {}

final class OnboardingStateLoading extends OnboardingState {}

final class OnboardingStateIdle extends OnboardingState {}

final class OnboardingStateLoggedIn extends OnboardingState {} // TODO temp

final class OnboardingStateError extends OnboardingState {
  final String message;

  OnboardingStateError(this.message);
}
