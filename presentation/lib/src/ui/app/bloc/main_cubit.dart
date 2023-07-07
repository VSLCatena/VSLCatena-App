import 'dart:async';

import 'package:domain/account.dart';
import 'package:domain/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/main_state.dart';

class MainCubit extends Cubit<MainState> {
  final GetCurrentUser _getCurrentUser;
  final GetDarkTheme _getDarkTheme;
  final GetUseMaterialYou _getUseMaterialYou;

  bool? _isLoggedIn;
  bool? _darkTheme;
  bool _useMaterialYou = false;

  StreamSubscription? _currentUserSubscription;
  StreamSubscription? _darkThemeSubscription;
  StreamSubscription? _useMaterialYouSubscription;

  MainCubit(this._getCurrentUser, this._getDarkTheme, this._getUseMaterialYou)
      : super(MainStateLoading()) {
    _getCurrentUser().listen((user) {
      _isLoggedIn = user != null;
      emit(_createState());
    });
    _darkThemeSubscription = _getDarkTheme().listen((darkTheme) {
      _darkTheme = darkTheme;
      emit(_createState());
    });
    _useMaterialYouSubscription = _getUseMaterialYou().listen((useMaterialYou) {
      _useMaterialYou = useMaterialYou;
      emit(_createState());
    });
  }

  MainState _createState() {
    final isLoggedIn = _isLoggedIn;
    if (isLoggedIn == null) {
      return MainStateLoading();
    }

    return MainStateSuccess(
      isLoggedIn: isLoggedIn,
      darkTheme: _darkTheme,
      useMaterialYou: _useMaterialYou,
    );
  }

  @override
  Future<void> close() {
    _currentUserSubscription?.cancel();
    _darkThemeSubscription?.cancel();
    _useMaterialYouSubscription?.cancel();
    return super.close();
  }
}
