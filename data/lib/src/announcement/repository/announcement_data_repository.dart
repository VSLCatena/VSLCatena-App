import 'package:domain/announcement.dart';
import 'package:domain/generic.dart';
import 'package:injectable/injectable.dart';

import '../mapper/announcement_mapper.dart';
import '../store/announcement_data_store.dart';

@Injectable(as: AnnouncementRepository)
class AnnouncementDataRepository implements AnnouncementRepository {
  final AnnouncementDataStore _dataStore;
  final AnnouncementMapper _announcementMapper;

  const AnnouncementDataRepository(this._dataStore, this._announcementMapper);

  @override
  Future<Announcement> createAnnouncement(Announcement announcement) {
    // TODO: implement createAnnouncement
    throw UnimplementedError();
  }

  @override
  Future<Announcement> deleteAnnouncement(int id) {
    // TODO: implement deleteAnnouncement
    throw UnimplementedError();
  }

  @override
  Future<Announcement> getAnnouncement(int id) {
    return _dataStore
        .getAnnouncement(id)
        .then((doc) => _announcementMapper.map(doc));
  }

  @override
  Future<ItemPage<Announcement>> getAnnouncements({
    ItemPageSuccess<Announcement>? previousPage,
  }) async {
    final docs = await _dataStore
        .getAnnouncementPage(previousDocument: previousPage?.nextKey)
        .then((value) => value.docs);

    if (docs.isEmpty) return ItemPageEmpty();

    final items = docs.map((doc) => _announcementMapper.map(doc)).toList();

    return ItemPageSuccess(items: await Future.wait(items), nextKey: docs.last);
  }

  @override
  Future<Announcement> updateAnnouncement(Announcement announcement) {
    // TODO: implement updateAnnouncement
    throw UnimplementedError();
  }
}
