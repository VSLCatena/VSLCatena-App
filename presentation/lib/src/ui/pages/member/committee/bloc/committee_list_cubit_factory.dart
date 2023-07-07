import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

import '../../../../widget/committee/mapper/committee_mapper.dart';
import 'committee_list_cubit.dart';

@injectable
class CommitteeListCubitFactory {
  final GetCommittees _getCommittees;
  final CommitteeMapper _committeeMapper;

  const CommitteeListCubitFactory(this._getCommittees, this._committeeMapper);

  CommitteeListCubit create() =>
      CommitteeListCubit(_getCommittees, _committeeMapper);
}
