abstract interface class StorageRepository {
  Stream<bool?> getDarkThemeStream();

  Future<void> setDarkTheme(bool? value);

  Stream<bool> getUseMaterialYouStream();

  Future<void> setUseMaterialYou(bool value);
}
