import 'package:domain/promo/usecase/get_promos.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/pages/promo/datasource/promo_data_source.dart';
import 'package:presentation/ui/pages/promo/mapper/promo_mapper.dart';

@injectable
class PromoDataSourceFactory {
  final GetPromos _getPromos;
  final PromoMapper _promoMapper;

  const PromoDataSourceFactory(this._getPromos, this._promoMapper);

  PromoDataSource create(BuildContext context) {
    return PromoDataSource(context, _getPromos, _promoMapper);
  }
}
