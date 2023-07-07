import 'package:domain/generic.dart';
import 'package:domain/promo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paging_view/paging_view.dart';

import '../bloc/promo_list_cubit.dart';
import '../datasource/promo_data_source.dart';
import '../model/promo_model.dart';
import 'promo_widget.dart';

class PromoListWidget extends StatelessWidget {
  const PromoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoListCubit, PromoDataSource>(
        builder: (context, dataSource) {
      return RefreshIndicator(
        child: PagingList<ItemPage<Promo>, PromoModel>(
          dataSource: dataSource,
          builder: (context, item, index) => Container(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
              child: PromoWidget(item)),
          errorBuilder: (context, error) => const Text('Error (TODO)'),
          initialLoadingWidget:
              const Center(child: CircularProgressIndicator()),
          appendLoadingWidget: const Center(child: CircularProgressIndicator()),
        ),
        onRefresh: () async => dataSource.refresh(),
      );
    });
  }
}
