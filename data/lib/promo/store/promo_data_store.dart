import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/general/firebase_types.dart';
import 'package:injectable/injectable.dart';

@injectable
class PromoDataStore {
  Future<RawFirebaseDocumentSnapshot> getPromo(int id) {
    return FirebaseFirestore.instance
        .collection('promo')
        .doc(id.toString())
        .get();
  }

  Future<RawFirebaseQuerySnapshot> getPromoPage({
    RawFirebaseDocumentSnapshot? previousDocument,
  }) async {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('promo')
        .orderBy('date', descending: true)
        .limit(10);

    if (previousDocument != null) {
      query = query.startAfterDocument(previousDocument);
    }

    return await query.get();
  }
}
