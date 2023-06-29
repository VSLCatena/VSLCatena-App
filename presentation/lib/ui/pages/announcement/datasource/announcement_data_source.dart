import 'package:domain/announcement/model/announcement.dart';
import 'package:domain/announcement/usecase/get_announcements.dart';
import 'package:domain/general/paging/item_page.dart';
import 'package:flutter/material.dart';
import 'package:presentation/ui/pages/announcement/model/announcement_model.dart';
import '../../../widget/paging/base_data_source.dart';
import '../mapper/announcement_mapper.dart';

final class AnnouncementDataSource
    extends BaseDataSource<Announcement, AnnouncementModel> {
  final GetAnnouncements _getAnnouncements;
  final AnnouncementMapper _announcementMapper;
  final BuildContext _context;

  AnnouncementDataSource(
      this._context, this._getAnnouncements, this._announcementMapper);

  @override
  Future<ItemPage<Announcement>> getItems(
      {ItemPageSuccess<Announcement>? previousPage}) {
    return _getAnnouncements(previousPage: previousPage);
  }

  @override
  AnnouncementModel map(Announcement item) {
    return _announcementMapper.map(_context, item);
  }
}
