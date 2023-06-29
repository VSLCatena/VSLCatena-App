import 'package:domain/association/usecase/get_committee.dart';
import 'package:domain/association/usecase/get_committee_members.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/pages/committee_profile/bloc/committee_profile_cubit.dart';

import '../mapper/committee_profile_mapper.dart';

@injectable
class CommitteeProfileCubitFactory {
  final GetCommittee _getCommittee;
  final GetCommitteeMembers _getCommitteeMembers;
  final CommitteeProfileMapper _profileMapper;

  const CommitteeProfileCubitFactory(
      this._getCommittee, this._getCommitteeMembers, this._profileMapper);

  CommitteeProfileCubit create(BuildContext context, String committeeId) {
    return CommitteeProfileCubit(context, committeeId, _profileMapper,
        _getCommittee, _getCommitteeMembers);
  }
}
