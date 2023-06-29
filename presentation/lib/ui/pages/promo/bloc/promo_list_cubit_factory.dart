import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/pages/promo/bloc/promo_list_cubit.dart';
import 'package:presentation/ui/pages/promo/datasource/promo_data_source_factory.dart';

@injectable
class PromoListCubitFactory {
  final PromoDataSourceFactory _factory;

  const PromoListCubitFactory(this._factory);

  PromoListCubit create(BuildContext context) {
    return PromoListCubit(context, _factory);
  }
}
