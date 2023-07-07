import 'package:domain/account.dart';
import 'package:injectable/injectable.dart';

import 'onboarding_bloc.dart';

@injectable
class OnboardingBlocFactory {
  final Login _login;
  final GetCurrentUser _getCurrentUser;

  const OnboardingBlocFactory(this._login, this._getCurrentUser);

  OnboardingBloc create() {
    return OnboardingBloc(_login, _getCurrentUser);
  }
}
