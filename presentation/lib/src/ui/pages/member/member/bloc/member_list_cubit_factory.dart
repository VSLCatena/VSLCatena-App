import 'package:injectable/injectable.dart';

import '../datasource/member_data_source_factory.dart';
import 'member_list_cubit.dart';

@injectable
class MemberListCubitFactory {
  final MemberDataSourceFactory _factory;

  const MemberListCubitFactory(this._factory);

  MemberListCubit create() {
    return MemberListCubit(_factory);
  }
}
