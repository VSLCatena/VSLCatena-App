import 'dart:async';

import 'package:domain/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/onboarding_event.dart';
import '../model/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final Login _login;
  final GetCurrentUser _getCurrentUser;

  StreamSubscription? _currentUserSubscription;

  OnboardingBloc(this._login, this._getCurrentUser)
      : super(OnboardingStateIdle()) {
    _currentUserSubscription = _getCurrentUser().listen((event) {
      if (event == null) {
        add(OnboardingLoginError('test'));
      } else {
        add(OnboardingLoginSuccess());
      }
    });

    on<OnboardingLoginPressed>(_onLoginPressed);
    on<OnboardingLoginSuccess>(
        (event, emit) => emit(OnboardingStateLoggedIn()));
    on<OnboardingLoginError>(
        (event, emit) => emit(OnboardingStateError(event.message)));
  }

  void _onLoginPressed(
      OnboardingEvent event, Emitter<OnboardingState> emit) async {
    emit(OnboardingStateLoading());
    try {
      await _login();
      add(OnboardingLoginSuccess());
    } catch (e) {
      emit(OnboardingStateError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _currentUserSubscription?.cancel();
    return super.close();
  }
}
