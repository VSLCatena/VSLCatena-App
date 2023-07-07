import 'dart:async';

import 'package:domain/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../member/mapper/member_mapper.dart';
import '../model/app_drawer_state.dart';

class AppDrawerCubit extends Cubit<AppDrawerState> {
  final GetCurrentUser _getCurrentUser;
  final MemberMapper _memberMapper;

  StreamSubscription? _currentUserSubscription;

  AppDrawerCubit(this._getCurrentUser, this._memberMapper)
      : super(AppDrawerState(null)) {
    _currentUserSubscription = _getCurrentUser().listen((user) {
      emit(AppDrawerState(user != null ? _memberMapper.map(user) : null));
    });
  }

  @override
  Future<void> close() {
    _currentUserSubscription?.cancel();
    return super.close();
  }
}
