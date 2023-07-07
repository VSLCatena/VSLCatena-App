import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCommittee {
  final AssociationRepository _repository;

  const GetCommittee(this._repository);

  Future<Committee> call(String committeeId, {bool allowCache = true}) async {
    return _repository.getCommittees(allowCache: allowCache).then(
        (committees) =>
            committees.firstWhere((element) => element.id == committeeId));
  }
}
