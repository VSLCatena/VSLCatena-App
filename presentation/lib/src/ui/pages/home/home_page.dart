import 'package:flutter/material.dart';

import '../../widget/scaffold/app_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _page(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Test title",
      child: Container(
        alignment: Alignment.topRight,
        child: _page(context),
      ),
    );
  }
}
