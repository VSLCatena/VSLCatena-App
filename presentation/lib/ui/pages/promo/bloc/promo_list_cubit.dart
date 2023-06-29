import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/ui/pages/promo/datasource/promo_data_source.dart';
import 'package:presentation/ui/pages/promo/datasource/promo_data_source_factory.dart';

class PromoListCubit extends Cubit<PromoDataSource> {
  PromoListCubit(BuildContext context, PromoDataSourceFactory factory)
      : super(factory.create(context));
}
