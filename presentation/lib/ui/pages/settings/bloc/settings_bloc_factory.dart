import 'package:domain/storage/usecase/get_dark_theme.dart';
import 'package:domain/storage/usecase/get_use_material_you.dart';
import 'package:domain/storage/usecase/set_dark_theme.dart';
import 'package:domain/storage/usecase/set_use_material_you.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/pages/settings/bloc/settings_bloc.dart';

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
