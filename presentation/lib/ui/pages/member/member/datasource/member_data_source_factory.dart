import 'package:domain/association/usecase/get_members.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/pages/member/member/datasource/member_data_source.dart';

import '../../../../widget/member/mapper/member_mapper.dart';

@injectable
class MemberDataSourceFactory {
  final GetMembers _getMembers;
  final MemberMapper _memberMapper;

  const MemberDataSourceFactory(this._getMembers, this._memberMapper);

  MemberDataSource create() {
    return MemberDataSource(_getMembers, _memberMapper);
  }
}
