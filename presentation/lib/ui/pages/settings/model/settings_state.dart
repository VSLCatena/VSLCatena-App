sealed class SettingsState {}

final class SettingsStateLoading extends SettingsState {}

final class SettingsStateSuccess extends SettingsState {
  final bool? darkTheme;
  final bool? useMaterialYou;

  SettingsStateSuccess({required this.darkTheme, required this.useMaterialYou});
}

final class SettingsStateError extends SettingsState {
  final String message;

  SettingsStateError(this.message);
}
