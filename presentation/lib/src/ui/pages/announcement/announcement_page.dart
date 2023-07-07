import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../widget/scaffold/app_scaffold.dart';
import 'bloc/announcement_list_cubit.dart';
import 'datasource/announcement_data_source_factory.dart';
import 'widget/announcement_list_widget.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.titleAnnouncements,
      child: Container(
        alignment: Alignment.topRight,
        child: BlocProvider(
          create: (context) => AnnouncementListCubit(
              context, GetIt.I<AnnouncementDataSourceFactory>()),
          child: const AnnouncementListWidget(),
        ),
      ),
    );
  }
}
