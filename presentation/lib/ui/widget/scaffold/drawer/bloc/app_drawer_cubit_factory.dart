import 'package:domain/account/usecase/get_current_user.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/widget/scaffold/drawer/bloc/app_drawer_cubit.dart';

import '../../../member/mapper/member_mapper.dart';

@injectable
class AppDrawerCubitFactory {
  final GetCurrentUser _getCurrentUser;
  final MemberMapper _memberMapper;

  const AppDrawerCubitFactory(this._getCurrentUser, this._memberMapper);

  AppDrawerCubit create() {
    return AppDrawerCubit(_getCurrentUser, _memberMapper);
  }
}
