sealed class SettingsEvent {}

final class SettingsUpdateState extends SettingsEvent {}

final class SettingsDarkThemeChanged extends SettingsEvent {
  final bool? darkTheme;

  SettingsDarkThemeChanged(this.darkTheme);
}

final class SettingsUseMaterialYouChanged extends SettingsEvent {
  final bool useMaterialYou;

  SettingsUseMaterialYouChanged(this.useMaterialYou);
}
