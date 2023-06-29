import 'package:flutter/material.dart';

import 'bottombar/app_bottom_navigation_bar.dart';
import 'drawer/app_drawer.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final PreferredSizeWidget? appBarBottom;

  const AppScaffold(
      {super.key, required this.title, required this.child, this.appBarBottom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title), bottom: appBarBottom),
        drawer: const AppDrawer(),
        bottomNavigationBar: const AppBottomNavigationBar(),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.2,
        body: child);
  }
}
