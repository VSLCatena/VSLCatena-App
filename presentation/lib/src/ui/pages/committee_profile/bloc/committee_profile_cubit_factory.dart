import 'package:domain/association.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../mapper/committee_profile_mapper.dart';
import 'committee_profile_cubit.dart';

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
