import 'package:domain/association/usecase/get_committee_members.dart';
import 'package:domain/association/usecase/get_committee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../mapper/committee_profile_mapper.dart';
import '../model/committee_profile_state.dart';

class CommitteeProfileCubit extends Cubit<CommitteeProfileState> {
  final GetCommittee _getCommittee;
  final GetCommitteeMembers _getCommitteeMembers;
  final CommitteeProfileMapper _profileMapper;
  final String _committeeId;

  CommitteeProfileCubit(BuildContext context, this._committeeId,
      this._profileMapper, this._getCommittee, this._getCommitteeMembers)
      : super(CommitteeProfileStateLoading()) {
    _load();
  }

  Future<void> refresh() async {
    _load();
  }

  Future<void> _load() async {
    try {
      emit(CommitteeProfileStateLoading());
      final committee = await _getCommittee(_committeeId);
      final members = await _getCommitteeMembers(committee);
      final profile = _profileMapper.map(committee, members);
      emit(CommitteeProfileStateSuccess(profile));
    } catch (e) {
      emit(CommitteeProfileStateError());
    }
  }
}
