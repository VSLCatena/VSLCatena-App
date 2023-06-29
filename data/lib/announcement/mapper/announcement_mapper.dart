import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/announcement/model/announcement.dart';
import 'package:domain/association/usecase/get_member.dart';
import 'package:injectable/injectable.dart';

@injectable
class AnnouncementMapper {
  final GetMember _getMember;

  const AnnouncementMapper(this._getMember);

  Future<Announcement> map(
      DocumentSnapshot<Map<String, dynamic>> document) async {
    try {
      final data = document.data()!;

      return Announcement(
        id: document.id,
        title: data['title']! as String,
        content: data['content']! as String,
        date: (data['date']! as Timestamp).toDate(),
        member: await _getMember(data['memberId']! as String),
      );
    } catch (e) {
      log('error trying to parse announcement with id ${document.id} (${document.data()}) $e');
      rethrow;
    }
  }
}
