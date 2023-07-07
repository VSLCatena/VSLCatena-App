import 'package:domain/account.dart';
import 'package:injectable/injectable.dart';

import '../../../member/mapper/member_mapper.dart';
import 'app_drawer_cubit.dart';

@injectable
class AppDrawerCubitFactory {
  final GetCurrentUser _getCurrentUser;
  final MemberMapper _memberMapper;

  const AppDrawerCubitFactory(this._getCurrentUser, this._memberMapper);

  AppDrawerCubit create() {
    return AppDrawerCubit(_getCurrentUser, _memberMapper);
  }
}
