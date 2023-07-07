import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../datasource/announcement_data_source.dart';
import '../datasource/announcement_data_source_factory.dart';

class AnnouncementListCubit extends Cubit<AnnouncementDataSource> {
  AnnouncementListCubit(
      BuildContext context, AnnouncementDataSourceFactory factory)
      : super(factory.create(context));
}
