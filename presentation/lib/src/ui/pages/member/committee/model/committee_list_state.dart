import '../../../../widget/committee/model/committee_model.dart';

sealed class CommitteeListState {}

class CommitteeListLoading extends CommitteeListState {}

class CommitteeListSuccess extends CommitteeListState {
  final List<CommitteeModel> committees;

  CommitteeListSuccess(this.committees);
}

class CommitteeListError extends CommitteeListState {}
