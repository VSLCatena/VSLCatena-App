import 'package:domain/association/repository/association_repository.dart';
import 'package:injectable/injectable.dart';

import '../model/committee.dart';

@injectable
class GetCommittees {
  final AssociationRepository _repository;

  const GetCommittees(this._repository);

  Future<List<Committee>> call({bool allowCache = true}) async {
    return _repository.getCommittees(allowCache: allowCache);
  }
}
