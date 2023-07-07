import 'committee_profile_model.dart';

sealed class CommitteeProfileState {}

class CommitteeProfileStateLoading extends CommitteeProfileState {
  CommitteeProfileStateLoading() : super();
}

class CommitteeProfileStateSuccess extends CommitteeProfileState {
  final CommitteeProfileModel profile;

  CommitteeProfileStateSuccess(this.profile) : super();
}

class CommitteeProfileStateError extends CommitteeProfileState {
  CommitteeProfileStateError() : super();
}
