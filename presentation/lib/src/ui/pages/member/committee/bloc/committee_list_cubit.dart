import 'package:domain/association.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/committee/mapper/committee_mapper.dart';
import '../model/committee_list_state.dart';

class CommitteeListCubit extends Cubit<CommitteeListState> {
  final GetCommittees _getCommittees;
  final CommitteeMapper _committeeMapper;

  CommitteeListCubit(this._getCommittees, this._committeeMapper)
      : super(CommitteeListLoading()) {
    _getCommittees().then((committees) => emit(
        CommitteeListSuccess(committees.map(_committeeMapper.map).toList())));
  }

  Future<void> refresh() async {
    try {
      emit(CommitteeListLoading());
      final committees = await _getCommittees(allowCache: false);
      emit(CommitteeListSuccess(committees.map(_committeeMapper.map).toList()));
    } catch (e) {
      emit(CommitteeListError());
    }
  }
}
