import 'package:domain/association/model/member.dart';
import 'package:domain/general/paging/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paging_view/paging_view.dart';
import 'package:presentation/ui/pages/member/member/bloc/member_list_cubit.dart';
import 'package:presentation/ui/pages/member/member/datasource/member_data_source.dart';
import 'package:presentation/ui/widget/member/member_item_widget.dart';

import '../../../../widget/member/model/member_model.dart';

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
