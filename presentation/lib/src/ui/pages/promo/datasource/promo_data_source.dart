import 'package:domain/generic.dart';
import 'package:domain/promo.dart';
import 'package:flutter/material.dart';
import '../../../widget/paging/base_data_source.dart';
import '../mapper/promo_mapper.dart';
import '../model/promo_model.dart';

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
