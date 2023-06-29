import 'dart:async';

import 'package:domain/storage/usecase/get_dark_theme.dart';
import 'package:domain/storage/usecase/get_use_material_you.dart';
import 'package:domain/storage/usecase/set_dark_theme.dart';
import 'package:domain/storage/usecase/set_use_material_you.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/ui/pages/settings/model/settings_state.dart';

import '../model/settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetDarkTheme _getDarkTheme;
  final SetDarkTheme _setDarkTheme;
  final GetUseMaterialYou _getUseMaterialYou;
  final SetUseMaterialYou _setUseMaterialYou;

  bool? _currentDarkTheme;
  StreamSubscription? _darkThemeSubscription;

  bool? _currentUseMaterialYou;
  StreamSubscription? _useMaterialYouSubscription;

  SettingsBloc(this._getDarkTheme, this._setDarkTheme, this._getUseMaterialYou,
      this._setUseMaterialYou)
      : super(SettingsStateLoading()) {
    on<SettingsUpdateState>((event, emit) => _updateState(emit));
    on<SettingsDarkThemeChanged>(_onDarkThemeButtonPressed);
    on<SettingsUseMaterialYouChanged>(_onUseMaterialYouButtonPressed);

    _darkThemeSubscription = _getDarkTheme().listen((darkTheme) {
      _currentDarkTheme = darkTheme;
      add(SettingsUpdateState());
    });

    _useMaterialYouSubscription = _getUseMaterialYou().listen((useMaterialYou) {
      _currentUseMaterialYou = useMaterialYou;
      add(SettingsUpdateState());
    });

    // Send initialize event
    add(SettingsUpdateState());
  }

  void _onDarkThemeButtonPressed(SettingsDarkThemeChanged event, emit) async {
    await _setDarkTheme(event.darkTheme);
  }

  void _onUseMaterialYouButtonPressed(
      SettingsUseMaterialYouChanged event, emit) async {
    await _setUseMaterialYou(event.useMaterialYou);
  }

  Future<void> _updateState(emit) async {
    emit(SettingsStateSuccess(
        darkTheme: _currentDarkTheme, useMaterialYou: _currentUseMaterialYou));
  }

  @override
  Future<void> close() {
    _darkThemeSubscription?.cancel();
    _useMaterialYouSubscription?.cancel();
    return super.close();
  }
}
