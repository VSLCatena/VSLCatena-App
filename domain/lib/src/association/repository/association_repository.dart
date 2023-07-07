import 'package:domain/association.dart';
import 'package:domain/generic.dart';

abstract interface class AssociationRepository {
  Future<List<Committee>> getCommittees({bool allowCache = true});

  Future<ItemPage<Member>> getMembers({ItemPageSuccess<Member>? previousPage});

  Future<Member> getMember(String id, {bool allowCache = true});

  Future<List<Member>> getCommitteeMembers(String committeeId);
}
