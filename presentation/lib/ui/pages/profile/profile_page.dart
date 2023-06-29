import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/ui/pages/profile/bloc/profile_cubit.dart';
import 'package:presentation/ui/pages/profile/model/profile_model.dart';
import 'package:presentation/ui/widget/committee/model/committee_model.dart';
import 'package:presentation/ui/widget/profile/profile_image.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../widget/committee/committee_item_widget.dart';
import '../../widget/scaffold/app_scaffold.dart';
import 'bloc/profile_cubit_factory.dart';
import 'model/profile_state.dart';

class ProfilePage extends StatelessWidget {
  final String _memberId;

  const ProfilePage(this._memberId, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.titleProfile,
      child: BlocProvider(
        create: (context) =>
            GetIt.I<ProfileCubitFactory>().create(context, _memberId),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) => _stateHandler(context, state),
        ),
      ),
    );
  }

  Widget _stateHandler(BuildContext context, ProfileState state) {
    switch (state) {
      case ProfileStateLoading():
        return const Center(child: CircularProgressIndicator());
      case ProfileStateSuccess():
        return _page(context, state.profile);
      case ProfileStateError():
        return const Text("Error loading profile (TODO)");
    }
  }

  Widget _page(BuildContext context, ProfileModel profile) {
    final localization = AppLocalizations.of(context)!;
    final subText = [profile.nickname, profile.pronouns]
        .whereType<String>()
        .join(localization.textSeparator);

    return ListView(children: [
      const SizedBox(height: 8),
      Align(child: ProfileImage(image: profile.image, size: 128)),
      Align(
          child: Text(profile.name,
              style: Theme.of(context).textTheme.headlineSmall)),
      if (subText.isNotEmpty)
        Align(
            child: Text(subText, style: Theme.of(context).textTheme.bodyLarge)),
      if (profile.committees.isNotEmpty)
        _committees(context, profile.committees)
    ]);
  }

  Widget _committees(BuildContext context, List<CommitteeModel> committees) {
    final committeesTitle = AppLocalizations.of(context)!.profileCommitteeTitle;

    return Column(children: [
      const SizedBox(height: 16),
      Text(committeesTitle, style: Theme.of(context).textTheme.bodyLarge!),
      for (final committee in committees)
        SizedBox(width: double.infinity, child: CommitteeItemWidget(committee))
    ]);
  }
}
