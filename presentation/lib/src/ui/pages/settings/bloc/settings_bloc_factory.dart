import 'package:domain/storage.dart';
import 'package:injectable/injectable.dart';

import 'settings_bloc.dart';

@injectable
class SettingsBlocFactory {
  final GetDarkTheme _getDarkTheme;
  final SetDarkTheme _setDarkTheme;
  final GetUseMaterialYou _getUseMaterialYou;
  final SetUseMaterialYou _setUseMaterialYou;

  const SettingsBlocFactory(this._getDarkTheme, this._setDarkTheme,
      this._getUseMaterialYou, this._setUseMaterialYou);

  SettingsBloc create() {
    return SettingsBloc(
        _getDarkTheme, _setDarkTheme, _getUseMaterialYou, _setUseMaterialYou);
  }
}
