import 'profile_model.dart';

sealed class ProfileState {}

class ProfileStateLoading extends ProfileState {
  ProfileStateLoading() : super();
}

class ProfileStateSuccess extends ProfileState {
  final ProfileModel profile;

  ProfileStateSuccess(this.profile) : super();
}

class ProfileStateError extends ProfileState {
  ProfileStateError() : super();
}
