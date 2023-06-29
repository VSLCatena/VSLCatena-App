import 'package:domain/account/usecase/get_current_user.dart';
import 'package:domain/account/usecase/login.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/pages/onboarding/bloc/onboarding_bloc.dart';

@injectable
class OnboardingBlocFactory {
  final Login _login;
  final GetCurrentUser _getCurrentUser;

  const OnboardingBlocFactory(this._login, this._getCurrentUser);

  OnboardingBloc create() {
    return OnboardingBloc(_login, _getCurrentUser);
  }
}
