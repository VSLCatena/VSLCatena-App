import 'package:data/promo/mapper/promo_mapper.dart';
import 'package:domain/promo/model/promo.dart';
import 'package:domain/promo/repository/promo_repository.dart';
import 'package:domain/general/paging/item_page.dart';
import 'package:injectable/injectable.dart';

import '../store/promo_data_store.dart';

@Injectable(as: PromoRepository)
class PromoDataRepository implements PromoRepository {
  final PromoDataStore _dataStore;
  final PromoMapper _promoMapper;

  const PromoDataRepository(this._dataStore, this._promoMapper);

  @override
  Future<Promo> createPromo(Promo promo) {
    // TODO: implement createpromo
    throw UnimplementedError();
  }

  @override
  Future<Promo> deletePromo(int id) {
    // TODO: implement deletepromo
    throw UnimplementedError();
  }

  @override
  Future<Promo> getPromo(int id) {
    return _dataStore.getPromo(id).then((doc) => _promoMapper.map(doc));
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
  Future<Promo> updatePromo(Promo promo) {
    // TODO: implement updatepromo
    throw UnimplementedError();
  }
}
