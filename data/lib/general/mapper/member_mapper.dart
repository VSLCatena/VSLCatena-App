import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/association/model/committee.dart';
import 'package:domain/association/model/member.dart';
import 'package:injectable/injectable.dart';

import '../image/async_image_creator.dart';
import 'date_time_mapper.dart';

@injectable
class MemberMapper {
  final DateTimeMapper _dateTimeMapper;
  final AsyncImageCreator _asyncImageCreator;

  const MemberMapper(this._dateTimeMapper, this._asyncImageCreator);

  Member map(DocumentSnapshot<Map<String, dynamic>> document,
      List<Committee> allCommittees) {
    try {
      final data = document.data()!;
      final committees = (data['committees'] as List)
          .map((committeeId) => _lookupCommittee(allCommittees, committeeId))
          .whereType<Committee>()
          .toList();

      return Member(
        id: document.id,
        name: data['name'],
        pronouns: data['pronouns'],
        nickname: data['nickname'],
        birthDate: data['birthDate'] != null
            ? _dateTimeMapper.map(data['birthDate'])
            : null,
        image: _asyncImageCreator.create('profiles/${document.id}.jpg',
            'members/${document.id}/profile.jpg'),
        committees: committees,
      );
    } catch (e) {
      log('error trying to parse member with id ${document.id} (${document.data()}) $e');
      rethrow;
    }
  }

  Committee? _lookupCommittee(
      List<Committee> allCommittees, String committeeId) {
    try {
      return allCommittees
          .firstWhere((committee) => committee.id == committeeId);
    } catch (e) {
      return null;
    }
  }
}
