import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/promo.dart';
import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

@injectable
class PromoResponseMapper {
  final GetMember _getMember;

  const PromoResponseMapper(this._getMember);

  Future<Promo> map(DocumentSnapshot<Map<String, dynamic>> doc) async {
    try {
      final data = doc.data()!;

      return Promo(
          id: doc.id,
          title: data['title']! as String,
          content: data['content'],
          date: (data['date']! as Timestamp).toDate(),
          member: await _getMember(data['memberId']! as String));
    } catch (e) {
      log('error trying to parse promo with id ${doc.id} (${doc.data()}) $e');
      rethrow;
    }
  }
}
