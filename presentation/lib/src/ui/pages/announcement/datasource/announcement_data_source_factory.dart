import 'package:domain/announcement.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../mapper/announcement_mapper.dart';
import 'announcement_data_source.dart';

@injectable
class AnnouncementDataSourceFactory {
  final GetAnnouncements _getAnnouncements;
  final AnnouncementMapper _announcementMapper;

  const AnnouncementDataSourceFactory(
      this._getAnnouncements, this._announcementMapper);

  AnnouncementDataSource create(BuildContext context) {
    return AnnouncementDataSource(
        context, _getAnnouncements, _announcementMapper);
  }
}
