import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

import '../../../../widget/member/mapper/member_mapper.dart';
import 'member_data_source.dart';

@injectable
class MemberDataSourceFactory {
  final GetMembers _getMembers;
  final MemberMapper _memberMapper;

  const MemberDataSourceFactory(this._getMembers, this._memberMapper);

  MemberDataSource create() {
    return MemberDataSource(_getMembers, _memberMapper);
  }
}
