import 'package:flutter/material.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../model/promo_model.dart';

class PromoWidget extends StatelessWidget {
  final PromoModel _promo;

  const PromoWidget(this._promo, {super.key});

  Widget _content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contentHeader(context),
        const Divider(),
        Text(_promo.content),
      ],
    );
  }

  Widget _contentHeader(BuildContext context) {
    return Row(children: [
      const Image(
        image: AssetImage('assets/logo.png', package: 'presentation'),
        width: 80,
        height: 80,
      ),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_promo.title),
          Text(_promo.dateText),
          Text(
              '${AppLocalizations.of(context)!.writtenBy} ${_promo.user.name}'),
        ],
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: _content(context),
      ),
    );
  }
}
