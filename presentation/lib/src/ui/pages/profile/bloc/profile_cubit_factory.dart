import 'package:domain/association.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../mapper/profile_mapper.dart';
import 'profile_cubit.dart';

@injectable
class ProfileCubitFactory {
  final GetMember _getMember;
  final ProfileMapper _profileMapper;

  const ProfileCubitFactory(this._getMember, this._profileMapper);

  ProfileCubit create(BuildContext context, String memberId) {
    return ProfileCubit(context, memberId, _profileMapper, _getMember);
  }
}
