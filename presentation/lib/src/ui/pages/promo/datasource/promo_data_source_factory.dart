import 'package:domain/promo.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../mapper/promo_mapper.dart';
import 'promo_data_source.dart';

@injectable
class PromoDataSourceFactory {
  final GetPromos _getPromos;
  final PromoMapper _promoMapper;

  const PromoDataSourceFactory(this._getPromos, this._promoMapper);

  PromoDataSource create(BuildContext context) {
    return PromoDataSource(context, _getPromos, _promoMapper);
  }
}
