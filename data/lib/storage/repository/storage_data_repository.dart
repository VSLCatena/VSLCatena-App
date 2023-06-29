import 'dart:async';

import 'package:domain/storage/repository/storage_repository.dart';
import 'package:injectable/injectable.dart';
import '../store/storage_data_store.dart';

@Injectable(as: StorageRepository)
class StorageDataRepository implements StorageRepository {
  final StorageDataStore _dataStore;

  const StorageDataRepository(this._dataStore);

  @override
  Stream<bool?> getDarkThemeStream() => _dataStore.getDarkThemeStream();

  @override
  Future<void> setDarkTheme(bool? darkTheme) =>
      _dataStore.setDarkTheme(darkTheme);

  @override
  Stream<bool> getUseMaterialYouStream() => _dataStore.getUseMaterialYou();

  @override
  Future<void> setUseMaterialYou(bool value) =>
      _dataStore.setUseMaterialYou(value);
}
