import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

import '../model/member_model.dart';

@injectable
class MemberMapper {
  MemberModel map(Member member) {
    return MemberModel(
      id: member.id,
      name: member.name,
      pronouns: member.pronouns,
      nickname: member.nickname,
      image: member.image,
    );
  }
}
