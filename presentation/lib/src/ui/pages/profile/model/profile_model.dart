import 'package:domain/generic.dart';

import '../../../widget/committee/model/committee_model.dart';

class ProfileModel {
  final String name;
  final String? nickname;
  final String? pronouns;
  final AsyncImage? image;
  final List<CommitteeModel> committees;

  ProfileModel({
    required this.name,
    required this.nickname,
    required this.image,
    required this.pronouns,
    required this.committees,
  });
}
