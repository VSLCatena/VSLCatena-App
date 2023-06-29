sealed class MainState {}

final class MainStateLoading extends MainState {}

class MainStateSuccess extends MainState {
  final bool isLoggedIn;
  final bool? darkTheme;
  final bool useMaterialYou;

  MainStateSuccess({
    required this.isLoggedIn,
    required this.darkTheme,
    required this.useMaterialYou,
  });
}
