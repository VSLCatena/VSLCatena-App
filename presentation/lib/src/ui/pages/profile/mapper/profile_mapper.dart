import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

import '../../../widget/committee/mapper/committee_mapper.dart';
import '../model/profile_model.dart';

@injectable
class ProfileMapper {
  final CommitteeMapper _committeeMapper;

  const ProfileMapper(this._committeeMapper);

  ProfileModel map(Member member) {
    return ProfileModel(
      name: member.name,
      nickname: member.nickname,
      pronouns: member.pronouns,
      image: member.image,
      committees: member.committees.map(_committeeMapper.map).toList(),
    );
  }
}
