sealed class OnboardingEvent {}

final class OnboardingLoginPressed extends OnboardingEvent {}

final class OnboardingLoginSuccess extends OnboardingEvent {}

final class OnboardingLoginError extends OnboardingEvent {
  final String message;

  OnboardingLoginError(this.message);
}
