import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../src/ui/utils/extension/context_extensions.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../app/routes.dart';
import '../../member/model/member_model.dart';
import '../../profile/profile_image.dart';
import 'bloc/app_drawer_cubit.dart';
import 'bloc/app_drawer_cubit_factory.dart';
import 'model/app_drawer_state.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  List<Widget> _drawerMenu(BuildContext context) {
    return <Widget>[
      ListTile(
        title: Text(AppLocalizations.of(context)!.drawerSettings),
        leading: const Icon(Icons.settings),
        onTap: () {
          context.navigateTo(Destinations.settings);
        },
      ),
      ListTile(
        title: Text(AppLocalizations.of(context)!.drawerAbout),
        leading: const Icon(Icons.info),
        onTap: () {
          context.navigateTo(Destinations.about);
        },
      )
    ];
  }

  Widget _userInfo(BuildContext context, MemberModel? user) {
    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final localization = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    final bottomText = [user.nickname, user.pronouns]
        .whereType<String>()
        .join(localization.textSeparator);

    final userTextStyle =
        textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold);
    final bottomTextStyle = textTheme.labelSmall!.copyWith(
        color: Theme.of(context).colorScheme.onSurface.withAlpha(180));

    return Row(
      children: [
        ProfileImage(image: user.image, size: 64),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: userTextStyle,
            ),
            if (bottomText.isNotEmpty) Text(bottomText, style: bottomTextStyle),
          ],
        ),
      ],
    );
  }

  Widget _drawerHeader() {
    return DrawerHeader(
      child: BlocProvider(
        create: (context) => GetIt.I<AppDrawerCubitFactory>().create(),
        child: BlocBuilder<AppDrawerCubit, AppDrawerState>(
          builder: (context, state) => InkWell(
            onTap: () => context.navigateTo(Destinations.memberProfile
                .replaceFirst(':memberId', state.user?.id ?? '')),
            child: _userInfo(context, state.user),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      _drawerHeader(),
      Expanded(child: ListView(children: _drawerMenu(context))),
    ]));
  }
}
