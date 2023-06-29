import 'package:domain/association/model/committee.dart';
import 'package:domain/association/model/member.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/widget/member/mapper/member_mapper.dart';

import '../model/committee_profile_model.dart';

@injectable
class CommitteeProfileMapper {
  final MemberMapper _memberMapper;

  const CommitteeProfileMapper(this._memberMapper);

  CommitteeProfileModel map(Committee committee, List<Member> members) {
    return CommitteeProfileModel(
      name: committee.name,
      image: committee.image,
      email: committee.email,
      description: committee.description,
      members: members.map(_memberMapper.map).toList(),
    );
  }
}
