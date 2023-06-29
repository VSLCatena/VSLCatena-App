import 'package:domain/announcement/usecase/get_announcements.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/ui/pages/announcement/datasource/announcement_data_source.dart';
import 'package:presentation/ui/pages/announcement/mapper/announcement_mapper.dart';

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
