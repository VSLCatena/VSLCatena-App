import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/general/firebase_types.dart';
import 'package:injectable/injectable.dart';

@injectable
class AnnouncementDataStore {
  Future<RawFirebaseDocumentSnapshot> getAnnouncement(int id) {
    return FirebaseFirestore.instance
        .collection('news')
        .doc(id.toString())
        .get();
  }

  Future<RawFirebaseQuerySnapshot> getAnnouncementPage({
    RawFirebaseDocumentSnapshot? previousDocument,
  }) async {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('news')
        .orderBy('date', descending: true)
        .limit(10);

    if (previousDocument != null) {
      query = query.startAfterDocument(previousDocument);
    }

    return query.get();
  }
}
