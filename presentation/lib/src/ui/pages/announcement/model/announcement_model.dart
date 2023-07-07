import '../../../widget/member/model/member_model.dart';

class AnnouncementModel {
  final String title;
  final String content;
  final String dateText;
  final MemberModel user;

  const AnnouncementModel({
    required this.title,
    required this.content,
    required this.dateText,
    required this.user,
  });
}
