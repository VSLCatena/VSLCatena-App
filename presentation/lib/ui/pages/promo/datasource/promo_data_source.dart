import 'package:domain/promo/model/promo.dart';
import 'package:domain/promo/usecase/get_promos.dart';
import 'package:domain/general/paging/item_page.dart';
import 'package:flutter/material.dart';
import 'package:presentation/ui/pages/promo/model/promo_model.dart';
import '../../../widget/paging/base_data_source.dart';
import '../mapper/promo_mapper.dart';

final class PromoDataSource extends BaseDataSource<Promo, PromoModel> {
  final GetPromos _getPromos;
  final PromoMapper _promoMapper;
  final BuildContext _context;

  PromoDataSource(this._context, this._getPromos, this._promoMapper);

  @override
  Future<ItemPage<Promo>> getItems({ItemPageSuccess<Promo>? previousPage}) {
    return _getPromos(previousPage: previousPage);
  }

  @override
  PromoModel map(Promo item) {
    return _promoMapper.map(_context, item);
  }
}
