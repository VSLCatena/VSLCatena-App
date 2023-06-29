import 'package:domain/promo/model/promo.dart';
import 'package:domain/general/paging/item_page.dart';

abstract interface class PromoRepository {
  Future<ItemPage<Promo>> getPromos({ItemPageSuccess<Promo>? previousPage});

  Future<Promo> getPromo(int id);

  Future<Promo> createPromo(Promo promo);

  Future<Promo> updatePromo(Promo promo);

  Future<Promo> deletePromo(int id);
}
