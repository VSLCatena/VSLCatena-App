import 'package:domain/account.dart';
import 'package:domain/storage.dart';
import 'package:injectable/injectable.dart';

import 'main_cubit.dart';

@injectable
class MainCubitFactory {
  final GetCurrentUser _getCurrentUser;
  final GetDarkTheme _getDarkTheme;
  final GetUseMaterialYou _getUseMaterialYou;

  const MainCubitFactory(
      this._getCurrentUser, this._getDarkTheme, this._getUseMaterialYou);

  MainCubit create() {
    return MainCubit(_getCurrentUser, _getDarkTheme, _getUseMaterialYou);
  }
}
