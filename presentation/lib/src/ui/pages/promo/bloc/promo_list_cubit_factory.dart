import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../datasource/promo_data_source_factory.dart';
import 'promo_list_cubit.dart';

@injectable
class PromoListCubitFactory {
  final PromoDataSourceFactory _factory;

  const PromoListCubitFactory(this._factory);

  PromoListCubit create(BuildContext context) {
    return PromoListCubit(context, _factory);
  }
}
