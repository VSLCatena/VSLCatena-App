import 'package:domain/association.dart';
import 'package:domain/generic.dart';

class Member {
  final String id;
  final String name;
  final String? pronouns;
  final String? nickname;
  final DateTime? birthDate;
  final AsyncImage? image;
  final List<Committee> committees;

  const Member({
    required this.id,
    required this.name,
    required this.pronouns,
    required this.nickname,
    required this.birthDate,
    required this.image,
    required this.committees,
  });
}
