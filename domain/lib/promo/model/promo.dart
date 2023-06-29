import 'package:domain/association/model/member.dart';

class Promo {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final Member member;

  const Promo({
    required this.id,
    required this.title,
    required this.date,
    required this.content,
    required this.member,
  });
}
