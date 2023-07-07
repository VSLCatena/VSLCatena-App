import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../src/ui/utils/extension/context_extensions.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../app/routes.dart';

class _BarItem {
  final String Function(AppLocalizations) labelMaker;
  final IconData icon;
  final String destination;

  const _BarItem({
    required this.labelMaker,
    required this.icon,
    required this.destination,
  });
}

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  List<_BarItem> _getListItems() {
    return <_BarItem>[
      _BarItem(
          labelMaker: (AppLocalizations appLoc) => appLoc.bottomBarHome,
          icon: Icons.home,
          destination: Destinations.home),
      _BarItem(
          labelMaker: (AppLocalizations appLoc) => appLoc.bottomBarNews,
          icon: Icons.newspaper,
          destination: Destinations.news),
      _BarItem(
          labelMaker: (AppLocalizations appLoc) => appLoc.bottomBarPromo,
          icon: Icons.celebration,
          destination: Destinations.promo),
      _BarItem(
          labelMaker: (AppLocalizations appLoc) => appLoc.bottomBarMembers,
          icon: Icons.people,
          destination: Destinations.members)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _getSelectedIndex(context),
      items: _buildItems(context),
      onTap: (index) => _onItemClicked(context, index),
      unselectedItemColor: Theme.of(context).colorScheme.onSurface,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      type: BottomNavigationBarType.fixed,
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final currentRoute = GoRouter.of(context).location;
    final currentIndex =
        _getListItems().indexWhere((item) => item.destination == currentRoute);
    if (currentIndex >= 0) {
      return currentIndex;
    } else {
      return 0;
    }
  }

  List<BottomNavigationBarItem> _buildItems(BuildContext context) {
    return _getListItems()
        .map((item) => BottomNavigationBarItem(
              label: item.labelMaker(AppLocalizations.of(context)!),
              icon: Icon(item.icon),
            ))
        .toList();
  }

  void _onItemClicked(BuildContext context, int index) {
    final destination = _getListItems()[index].destination;
    context.topNavigateTo(destination);
  }
}
