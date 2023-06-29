import 'package:domain/announcement/model/announcement.dart';
import 'package:domain/general/paging/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paging_view/paging_view.dart';
import 'package:presentation/ui/pages/announcement/bloc/announcement_list_cubit.dart';
import 'package:presentation/ui/pages/announcement/datasource/announcement_data_source.dart';
import 'package:presentation/ui/pages/announcement/model/announcement_model.dart';
import 'package:presentation/ui/pages/announcement/widget/announcement_widget.dart';

class AnnouncementListWidget extends StatelessWidget {
  const AnnouncementListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementListCubit, AnnouncementDataSource>(
        builder: (context, dataSource) {
      return RefreshIndicator(
        child: PagingList<ItemPage<Announcement>, AnnouncementModel>(
          dataSource: dataSource,
          builder: _itemBuilder,
          errorBuilder: (context, error) => const Text('Error (TODO)'),
          initialLoadingWidget:
              const Center(child: CircularProgressIndicator()),
          appendLoadingWidget: const Center(child: CircularProgressIndicator()),
        ),
        onRefresh: () async => dataSource.refresh(),
      );
    });
  }

  Widget _itemBuilder(BuildContext _, AnnouncementModel item, int index) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      child: AnnouncementWidget(item),
    );
  }
}
