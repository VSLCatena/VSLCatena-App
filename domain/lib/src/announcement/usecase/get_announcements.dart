import 'package:domain/announcement.dart';
import 'package:domain/generic.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAnnouncements {
  final AnnouncementRepository _repository;

  const GetAnnouncements(this._repository);

  Future<ItemPage<Announcement>> call(
      {ItemPageSuccess<Announcement>? previousPage}) async {
    return _repository.getAnnouncements(previousPage: previousPage);
  }
}
