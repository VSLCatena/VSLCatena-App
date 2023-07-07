import 'package:domain/announcement.dart';
import 'package:domain/generic.dart';

abstract interface class AnnouncementRepository {
  Future<ItemPage<Announcement>> getAnnouncements(
      {ItemPageSuccess<Announcement>? previousPage});

  Future<Announcement> getAnnouncement(int id);

  Future<Announcement> createAnnouncement(Announcement announcement);

  Future<Announcement> updateAnnouncement(Announcement announcement);

  Future<Announcement> deleteAnnouncement(int id);
}
