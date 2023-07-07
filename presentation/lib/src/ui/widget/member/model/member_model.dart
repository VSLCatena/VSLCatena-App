import 'package:domain/generic.dart';

class MemberModel {
  final String id;
  final String name;
  final String? pronouns;
  final String? nickname;
  final AsyncImage? image;

  const MemberModel({
    required this.id,
    required this.name,
    required this.pronouns,
    required this.nickname,
    required this.image,
  });
}
