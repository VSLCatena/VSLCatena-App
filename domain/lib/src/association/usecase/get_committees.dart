import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCommittees {
  final AssociationRepository _repository;

  const GetCommittees(this._repository);

  Future<List<Committee>> call({bool allowCache = true}) async {
    return _repository.getCommittees(allowCache: allowCache);
  }
}
