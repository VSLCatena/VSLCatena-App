import 'package:domain/association/model/member.dart';
import 'package:domain/general/paging/item_page.dart';
import 'package:domain/association/usecase/get_members.dart';

import '../../../../widget/member/mapper/member_mapper.dart';
import '../../../../widget/member/model/member_model.dart';
import '../../../../widget/paging/base_data_source.dart';

final class MemberDataSource extends BaseDataSource<Member, MemberModel> {
  final GetMembers _getMembers;
  final MemberMapper _memberMapper;

  MemberDataSource(this._getMembers, this._memberMapper);

  @override
  Future<ItemPage<Member>> getItems({ItemPageSuccess<Member>? previousPage}) {
    return _getMembers(previousPage: previousPage);
  }

  @override
  MemberModel map(Member item) {
    return _memberMapper.map(item);
  }
}
