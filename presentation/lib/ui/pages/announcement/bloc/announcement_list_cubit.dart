import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/ui/pages/announcement/datasource/announcement_data_source.dart';
import 'package:presentation/ui/pages/announcement/datasource/announcement_data_source_factory.dart';

class AnnouncementListCubit extends Cubit<AnnouncementDataSource> {
  AnnouncementListCubit(
      BuildContext context, AnnouncementDataSourceFactory factory)
      : super(factory.create(context));
}
