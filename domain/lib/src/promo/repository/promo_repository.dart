import 'package:domain/generic.dart';
import 'package:domain/promo.dart';

abstract interface class PromoRepository {
  Future<ItemPage<Promo>> getPromos({ItemPageSuccess<Promo>? previousPage});

  Future<void> createPromo(CreatePromoModel promo);

  Future<void> updatePromo(UpdatePromoModel promo);

  Future<void> deletePromo(String id);
}
