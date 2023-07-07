import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../widget/scaffold/app_scaffold.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Widget _page(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.titleAbout,
      child: Container(
        alignment: Alignment.topRight,
        child: _page(context),
      ),
    );
  }
}
