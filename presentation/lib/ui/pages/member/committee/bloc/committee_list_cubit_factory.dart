import 'package:domain/association/usecase/get_committees.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/pages/member/committee/bloc/committee_list_cubit.dart';

import '../../../../widget/committee/mapper/committee_mapper.dart';

@injectable
class CommitteeListCubitFactory {
  final GetCommittees _getCommittees;
  final CommitteeMapper _committeeMapper;

  const CommitteeListCubitFactory(this._getCommittees, this._committeeMapper);

  CommitteeListCubit create() =>
      CommitteeListCubit(_getCommittees, _committeeMapper);
}
