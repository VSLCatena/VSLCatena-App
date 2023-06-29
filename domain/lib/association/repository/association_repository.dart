import 'package:domain/association/model/committee.dart';
import 'package:domain/general/paging/item_page.dart';

import '../model/member.dart';

abstract interface class AssociationRepository {
  Future<List<Committee>> getCommittees({bool allowCache = true});

  Future<ItemPage<Member>> getMembers({ItemPageSuccess<Member>? previousPage});

  Future<Member> getMember(String id, {bool allowCache = true});

  Future<List<Member>> getCommitteeMembers(String committeeId);
}
