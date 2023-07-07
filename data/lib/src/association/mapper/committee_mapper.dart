import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

@injectable
class CommitteeMapper {
  Committee? map(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    try {
      return Committee(
        id: document.id,
        name: data['name'],
        description: data['description'],
        email: data['email'],
        image: data['pictureUrl'],
      );
    } catch (e) {
      log('error trying to parse committee with id ${document.id} (${document.data()}) $e');
      return null;
    }
  }
}
