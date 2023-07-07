import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import '../../l10n/generated/app_localizations.dart';
import 'bloc/main_cubit.dart';
import 'bloc/main_cubit_factory.dart';
import 'model/main_state.dart';
import 'routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<MainCubitFactory>().create(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) => _handleStates(context, state),
      ),
    );
  }

  Widget _handleStates(BuildContext context, MainState state) {
    if (state is MainStateLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MainStateSuccess) {
      return _app(
          context, state.isLoggedIn, state.darkTheme, state.useMaterialYou);
    } else {
      throw Exception('Unknown state: $state');
    }
  }

  Widget _app(BuildContext context, bool isLoggedIn, bool? isDarkTheme,
      bool useMaterialYou) {
    final defaultRoute = isLoggedIn ? Destinations.home : Destinations.login;
    ThemeMode themeMode;
    switch (isDarkTheme) {
      case true:
        themeMode = ThemeMode.dark;
        break;
      case false:
        themeMode = ThemeMode.light;
        break;
      default:
        themeMode = ThemeMode.system;
    }

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        useMaterial3: useMaterialYou,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: useMaterialYou,
        brightness: Brightness.dark,
      ),
      themeMode: themeMode,
      routerConfig: GoRouter(routes: appRoutes, initialLocation: defaultRoute),
    );
  }
}
