import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/ui/pages/committee_profile/bloc/committee_profile_cubit_factory.dart';
import 'package:presentation/ui/widget/member/member_item_widget.dart';
import 'package:presentation/ui/widget/profile/profile_image.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../widget/member/model/member_model.dart';
import '../../widget/scaffold/app_scaffold.dart';
import 'bloc/committee_profile_cubit.dart';
import 'model/committee_profile_model.dart';
import 'model/committee_profile_state.dart';

class CommitteeProfilePage extends StatelessWidget {
  final String _committeeId;

  const CommitteeProfilePage(this._committeeId, {super.key});

  Widget _stateHandler(BuildContext context, CommitteeProfileState state) {
    switch (state) {
      case CommitteeProfileStateLoading():
        return const Center(child: CircularProgressIndicator());
      case CommitteeProfileStateSuccess():
        return _page(context, state.profile);
      case CommitteeProfileStateError():
        return const Text("Error loading profile (TODO)");
    }
  }

  Widget _page(BuildContext context, CommitteeProfileModel profile) {
    final email = profile.email;
    final description = profile.description;

    final textTheme = Theme.of(context).textTheme;
    final profileNameStyle = textTheme.headlineSmall!;
    final profileDescriptionStyle = textTheme.bodyLarge!;
    final profileEmailStyle =
        textTheme.bodyLarge!.copyWith(fontStyle: FontStyle.italic);

    return ListView(children: [
      const SizedBox(height: 8),
      Align(child: ProfileImage(image: profile.image, size: 128)),
      Align(child: Text(profile.name, style: profileNameStyle)),
      if (description != null && description.isNotEmpty == true)
        Align(child: Text(description, style: profileDescriptionStyle)),
      if (email?.isNotEmpty == true) const SizedBox(height: 4),
      if (email != null && email.isNotEmpty == true)
        Align(child: Text(email, style: profileEmailStyle)),
      if (profile.members.isNotEmpty) _membersList(context, profile.members)
    ]);
  }

  Widget _membersList(BuildContext context, List<MemberModel> members) {
    final localization = AppLocalizations.of(context)!;
    final profileMembersTitleStyle = Theme.of(context).textTheme.bodyLarge!;

    return Column(children: [
      const SizedBox(height: 16),
      Text(localization.committeeProfileMembersTitle,
          style: profileMembersTitleStyle),
      for (final member in members)
        SizedBox(width: double.infinity, child: MemberItemWidget(member))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.titleProfile,
      child: BlocProvider(
        create: (context) => GetIt.I<CommitteeProfileCubitFactory>()
            .create(context, _committeeId),
        child: BlocBuilder<CommitteeProfileCubit, CommitteeProfileState>(
          builder: (context, state) => _stateHandler(context, state),
        ),
      ),
    );
  }
}
