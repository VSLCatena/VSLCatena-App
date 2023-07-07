import 'package:domain/association.dart';
import 'package:domain/generic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paging_view/paging_view.dart';

import '../../../../widget/member/member_item_widget.dart';
import '../../../../widget/member/model/member_model.dart';
import '../bloc/member_list_cubit.dart';
import '../datasource/member_data_source.dart';

class MemberListWidget extends StatelessWidget {
  const MemberListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberListCubit, MemberDataSource>(
        builder: (context, dataSource) {
      return RefreshIndicator(
        child: PagingList<ItemPage<Member>, MemberModel>(
          dataSource: dataSource,
          builder: (context, item, index) => Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
            child: MemberItemWidget(item),
          ),
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
