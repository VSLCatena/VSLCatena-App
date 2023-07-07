import 'package:domain/generic.dart';
import 'package:domain/promo.dart';
import 'package:injectable/injectable.dart';

import '../mapper/promo_response_mapper.dart';
import '../store/promo_data_store.dart';

@Injectable(as: PromoRepository)
class PromoDataRepository implements PromoRepository {
  final PromoDataStore _dataStore;
  final PromoResponseMapper _promoMapper;

  const PromoDataRepository(this._dataStore, this._promoMapper);

  @override
  Future<Promo> createPromo(CreatePromoModel promo) {
    // TODO: implement createpromo
    throw UnimplementedError();
  }

  @override
  Future<Promo> deletePromo(String id) {
    // TODO: implement deletepromo
    throw UnimplementedError();
  }

  @override
  Future<ItemPage<Promo>> getPromos({
    ItemPageSuccess<Promo>? previousPage,
  }) async {
    final docs = await _dataStore
        .getPromoPage(previousDocument: previousPage?.nextKey)
        .then((value) => value.docs);

    if (docs.isEmpty) return ItemPageEmpty();

    final items = docs.map((doc) => _promoMapper.map(doc)).toList();

    return ItemPageSuccess(items: await Future.wait(items), nextKey: docs.last);
  }

  @override
  Future<Promo> updatePromo(UpdatePromoModel promo) {
    // TODO: implement updatepromo
    throw UnimplementedError();
  }
}
