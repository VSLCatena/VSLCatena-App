import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCommitteeMembers {
  final AssociationRepository _repository;

  const GetCommitteeMembers(this._repository);

  Future<List<Member>> call(Committee committee) async {
    return _repository.getCommitteeMembers(committee.id);
  }
}
