import 'package:domain/account/usecase/get_current_user.dart';
import 'package:domain/storage/usecase/get_dark_theme.dart';
import 'package:domain/storage/usecase/get_use_material_you.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/app/bloc/main_cubit.dart';

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
