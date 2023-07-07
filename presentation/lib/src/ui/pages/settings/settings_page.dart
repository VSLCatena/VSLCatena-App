import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../widget/scaffold/app_scaffold.dart';
import 'bloc/settings_bloc.dart';
import 'bloc/settings_bloc_factory.dart';
import 'model/settings_event.dart';
import 'model/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.titleSettings,
      child: Container(
        alignment: Alignment.topRight,
        child: BlocProvider(
          create: (context) => GetIt.I<SettingsBlocFactory>().create(),
          child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
            if (state is SettingsStateSuccess) {
              return _settings(context, state);
            } else {
              return const CircularProgressIndicator();
            }
          }),
        ),
      ),
    );
  }

  Widget _settings(BuildContext context, SettingsStateSuccess state) {
    final settingsBloc = context.read<SettingsBloc>();
    final themeMode = state.darkTheme == true
        ? Brightness.dark
        : Brightness.light; // TODO allow system default

    return SettingsList(
      brightness: themeMode,
      sections: [
        SettingsSection(tiles: [
          SettingsTile.switchTile(
            initialValue: state.darkTheme,
            onToggle: (state) => settingsBloc.add(
                SettingsDarkThemeChanged(state)), // TODO allow system default
            title: Text(AppLocalizations.of(context)!.settingsButtonDarkTheme),
          ),
          SettingsTile.switchTile(
            initialValue: state.useMaterialYou,
            onToggle: (state) =>
                settingsBloc.add(SettingsUseMaterialYouChanged(state)),
            title: Text(
                AppLocalizations.of(context)!.settingsButtonUseMaterialYou),
          )
        ])
      ],
    );
  }
}
