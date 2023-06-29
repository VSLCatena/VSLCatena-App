import 'package:flutter/material.dart';
import 'package:presentation/l10n/generated/app_localizations.dart';
import 'package:presentation/ui/pages/announcement/model/announcement_model.dart';

class AnnouncementWidget extends StatelessWidget {
  final AnnouncementModel _announcement;

  const AnnouncementWidget(this._announcement, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Image(
              image: AssetImage('assets/logo.png', package: 'presentation'),
              width: 80,
              height: 80,
            ),
            const SizedBox(width: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(_announcement.title),
              Text(_announcement.dateText),
              Text(
                  '${AppLocalizations.of(context)!.writtenBy} ${_announcement.user.name}'),
            ]),
          ]),
          const Divider(),
          Text(_announcement.content),
        ]),
      ),
    );
  }
}
