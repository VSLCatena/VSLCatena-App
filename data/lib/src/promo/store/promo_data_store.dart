import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/promo.dart';
import 'package:injectable/injectable.dart';

import '../../generic/firebase_types.dart';

@injectable
class PromoDataStore {
  Future<void> createPromo(Promo promo) {
    return FirebaseFirestore.instance
        .collection('promo')
        .add({'title': promo.title, 'date': FieldValue.serverTimestamp()});
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
