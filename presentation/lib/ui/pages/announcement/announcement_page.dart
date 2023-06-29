import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/l10n/generated/app_localizations.dart';
import 'package:presentation/ui/pages/announcement/bloc/announcement_list_cubit.dart';
import 'package:presentation/ui/pages/announcement/datasource/announcement_data_source_factory.dart';
import 'package:presentation/ui/pages/announcement/widget/announcement_list_widget.dart';

import '../../widget/scaffold/app_scaffold.dart';

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
