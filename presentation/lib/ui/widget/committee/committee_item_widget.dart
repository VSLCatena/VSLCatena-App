import 'package:flutter/material.dart';
import 'package:presentation/ui/app/routes.dart';
import 'package:presentation/ui/utils/extension/context_extensions.dart';

import '../profile/profile_image.dart';
import 'model/committee_model.dart';

class CommitteeItemWidget extends StatelessWidget {
  final CommitteeModel _committee;
  const CommitteeItemWidget(this._committee, {super.key});

  @override
  Widget build(BuildContext context) {
    final description = _committee.description;

    return Card(
      child: InkWell(
        onTap: () => {
          context.navigateTo(Destinations.committeeProfile
              .replaceFirst(':committeeId', _committee.id))
        },
        child: ListTile(
          title: Text(_committee.name),
          subtitle: description != null ? Text(description) : null,
          leading: ProfileImage(image: _committee.image, size: 48),
          onTap: () => context.navigateTo(Destinations.committeeProfile
              .replaceFirst(':committeeId', _committee.id)),
        ),
      ),
    );
  }
}
