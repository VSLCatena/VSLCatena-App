import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMember {
  final AssociationRepository _repository;

  const GetMember(this._repository);

  Future<Member> call(String id, {bool allowCache = true}) async {
    return _repository.getMember(id, allowCache: allowCache);
  }
}
