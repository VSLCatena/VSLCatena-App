import 'package:domain/association/model/member.dart';
import 'package:domain/association/repository/association_repository.dart';
import 'package:injectable/injectable.dart';

import '../../general/paging/item_page.dart';

@injectable
class GetMembers {
  final AssociationRepository _repository;

  const GetMembers(this._repository);

  Future<ItemPage<Member>> call({ItemPageSuccess<Member>? previousPage}) async {
    return _repository.getMembers(previousPage: previousPage);
  }
}
