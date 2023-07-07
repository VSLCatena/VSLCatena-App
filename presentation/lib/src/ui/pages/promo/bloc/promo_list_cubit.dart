import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../datasource/promo_data_source.dart';
import '../datasource/promo_data_source_factory.dart';

class PromoListCubit extends Cubit<PromoDataSource> {
  PromoListCubit(BuildContext context, PromoDataSourceFactory factory)
      : super(factory.create(context));
}
