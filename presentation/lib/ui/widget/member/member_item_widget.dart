import 'package:flutter/material.dart';
import 'package:presentation/ui/app/routes.dart';
import 'package:presentation/ui/utils/extension/context_extensions.dart';

import '../profile/profile_image.dart';
import 'model/member_model.dart';

class MemberItemWidget extends StatelessWidget {
  final MemberModel _member;

  const MemberItemWidget(this._member, {super.key});

  Widget _content(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final nameStyle =
        textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold);
    final underTextStyle = textTheme.labelSmall!.copyWith(
        color: Theme.of(context).colorScheme.onSurface.withAlpha(180));

    return Row(children: [
      ProfileImage(image: _member.image, size: 80),
      const SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_member.name, style: nameStyle),
          if (_member.underText != null)
            Text(_member.underText!, style: underTextStyle),
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.navigateTo(
            Destinations.memberProfile.replaceFirst(':memberId', _member.id)),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: _content(context),
        ),
      ),
    );
  }
}

extension on MemberModel {
  String? get underText {
    final underText =
        [nickname, pronouns].where((element) => element != null).join(' • ');
    return underText.isNotEmpty ? underText : null;
  }
}
