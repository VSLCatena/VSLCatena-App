import 'package:domain/promo/model/promo.dart';
import 'package:injectable/injectable.dart';
import '../../general/paging/item_page.dart';
import '../repository/promo_repository.dart';

@injectable
class GetPromos {
  final PromoRepository _repository;

  const GetPromos(this._repository);

  Future<ItemPage<Promo>> call({ItemPageSuccess<Promo>? previousPage}) async {
    return _repository.getPromos(previousPage: previousPage);
  }
}
