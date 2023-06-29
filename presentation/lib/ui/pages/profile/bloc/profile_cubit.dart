import 'package:domain/association/usecase/get_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/ui/pages/profile/mapper/profile_mapper.dart';
import 'package:presentation/ui/pages/profile/model/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetMember _getMember;
  final ProfileMapper _profileMapper;
  final String _memberId;

  ProfileCubit(BuildContext context, this._memberId, this._profileMapper,
      this._getMember)
      : super(ProfileStateLoading()) {
    _load();
  }

  Future<void> refresh() async {
    _load();
  }

  Future<void> _load() async {
    try {
      emit(ProfileStateLoading());
      final member = await _getMember(_memberId, allowCache: false);
      final profile = _profileMapper.map(member);
      emit(ProfileStateSuccess(profile));
    } catch (e) {
      emit(ProfileStateError());
    }
  }
}
