import 'package:domain/generic.dart';
import 'package:domain/promo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPromos {
  final PromoRepository _repository;

  const GetPromos(this._repository);

  Future<ItemPage<Promo>> call({ItemPageSuccess<Promo>? previousPage}) async {
    return _repository.getPromos(previousPage: previousPage);
  }
}
