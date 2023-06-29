import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/streams.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class StorageDataStore {
  static const _storageKeyDarkTheme = 'dark_theme';
  static const _storageKeyUseMaterialYou = 'use_material_you';

  final StreamController<bool?> _internalDarkThemeStreamController =
      StreamController.broadcast();
  late final Stream<bool?> _darkThemeStream =
      ValueConnectableStream(_internalDarkThemeStreamController.stream)
          .autoConnect();

  final StreamController<bool> _internalUseMaterialYouStreamController =
      StreamController.broadcast();
  late final Stream<bool> _useMaterialYouStream =
      ValueConnectableStream(_internalUseMaterialYouStreamController.stream)
          .autoConnect();

  StorageDataStore() {
    SharedPreferences.getInstance().then((prefs) {
      _internalDarkThemeStreamController
          .add(prefs.getBool(_storageKeyDarkTheme));
      _internalUseMaterialYouStreamController
          .add(prefs.getBool(_storageKeyUseMaterialYou) ?? false);
    });
  }

  Stream<bool?> getDarkThemeStream() => _darkThemeStream;

  Future<void> setDarkTheme(bool? darkTheme) async {
    final prefs = await SharedPreferences.getInstance();

    if (darkTheme != null) {
      prefs.setBool(_storageKeyDarkTheme, darkTheme);
    } else {
      prefs.remove(_storageKeyDarkTheme);
    }
    _internalDarkThemeStreamController.add(darkTheme);
  }

  Stream<bool> getUseMaterialYou() => _useMaterialYouStream;

  Future<void> setUseMaterialYou(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_storageKeyUseMaterialYou, value);

    _internalUseMaterialYouStreamController.add(value);
  }
}
