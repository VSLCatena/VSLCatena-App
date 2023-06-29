import 'package:cloud_firestore/cloud_firestore.dart';

extension CollectionCacheFirst<T> on CollectionReference<T> {
  Future<QuerySnapshot<T>> fetch({bool allowCache = true}) async {
    final data = await get(const GetOptions(source: Source.cache));
    if (data.size != 0) {
      return data;
    }
    return get();
  }
}

extension QueryCacheFirst<T> on Query<T> {
  Future<QuerySnapshot<T>> fetch({bool allowCache = true}) async {
    final data = await get(const GetOptions(source: Source.cache));
    if (data.size != 0) {
      return data;
    }
    return get();
  }
}

extension DocumentCacheFirst<T> on DocumentReference<T> {
  Future<DocumentSnapshot<T>> fetch({bool allowCache = true}) async {
    final data = await get(const GetOptions(source: Source.cache));
    if (data.exists) {
      return data;
    }
    return get();
  }
}
