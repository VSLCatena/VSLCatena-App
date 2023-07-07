import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/src/generic/firestore_extensions.dart';
import 'package:injectable/injectable.dart';

import '../../generic/firebase_types.dart';

@injectable
class AssociationDataStore {
  Future<RawFirebaseQuerySnapshot> getCommittees(
      {bool allowCache = true}) async {
    return await FirebaseFirestore.instance
        .collection('committees')
        .fetch(allowCache: allowCache);
  }

  Future<RawFirebaseDocumentSnapshot> getMember(String id,
      {bool allowCache = true}) async {
    return FirebaseFirestore.instance
        .collection('members')
        .doc(id)
        .fetch(allowCache: allowCache);
  }

  Future<RawFirebaseQuerySnapshot> getMemberPage({
    RawFirebaseDocumentSnapshot? previousDocument,
  }) async {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('members')
        .orderBy('name', descending: true)
        .limit(10);

    if (previousDocument != null) {
      query = query.startAfterDocument(previousDocument);
    }

    return query.get();
  }

  Future<RawFirebaseQuerySnapshot> getCommitteeMembers(
      String committeeId) async {
    return FirebaseFirestore.instance
        .collection('members')
        .where('committees', arrayContains: committeeId)
        .get();
  }
}
