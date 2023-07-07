import '../../../widget/member/model/member_model.dart';

class PromoModel {
  final String title;
  final String content;
  final String dateText;
  final MemberModel user;

  const PromoModel({
    required this.title,
    required this.content,
    required this.dateText,
    required this.user,
  });
}
