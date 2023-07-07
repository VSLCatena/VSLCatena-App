import 'package:domain/association.dart';
import 'package:domain/generic.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMembers {
  final AssociationRepository _repository;

  const GetMembers(this._repository);

  Future<ItemPage<Member>> call({ItemPageSuccess<Member>? previousPage}) async {
    return _repository.getMembers(previousPage: previousPage);
  }
}
