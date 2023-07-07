import 'package:injectable/injectable.dart';

@injectable
class CreatePromoRequestMapper {
  Map<String, dynamic> map(
      String title, String content, DateTime date, String memberId) {
    return {
      'title': title,
      'content': content,
      'date': date,
      'memberId': memberId,
    };
  }
}
