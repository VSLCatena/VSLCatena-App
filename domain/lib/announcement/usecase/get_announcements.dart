import 'package:domain/announcement/model/announcement.dart';
import 'package:injectable/injectable.dart';
import '../../general/paging/item_page.dart';
import '../repository/announcement_repository.dart';

@injectable
class GetAnnouncements {
  final AnnouncementRepository _repository;

  const GetAnnouncements(this._repository);

  Future<ItemPage<Announcement>> call(
      {ItemPageSuccess<Announcement>? previousPage}) async {
    return _repository.getAnnouncements(previousPage: previousPage);
  }
}
