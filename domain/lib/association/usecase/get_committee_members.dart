import 'package:domain/association/model/member.dart';
import 'package:domain/association/repository/association_repository.dart';
import 'package:injectable/injectable.dart';

import '../model/committee.dart';

@injectable
class GetCommitteeMembers {
  final AssociationRepository _repository;

  const GetCommitteeMembers(this._repository);

  Future<List<Member>> call(Committee committee) async {
    return _repository.getCommitteeMembers(committee.id);
  }
}
