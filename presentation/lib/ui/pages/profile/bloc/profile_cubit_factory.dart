import 'package:domain/association/usecase/get_member.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/pages/profile/bloc/profile_cubit.dart';

import '../mapper/profile_mapper.dart';

@injectable
class ProfileCubitFactory {
  final GetMember _getMember;
  final ProfileMapper _profileMapper;

  const ProfileCubitFactory(this._getMember, this._profileMapper);

  ProfileCubit create(BuildContext context, String memberId) {
    return ProfileCubit(context, memberId, _profileMapper, _getMember);
  }
}
