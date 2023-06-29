import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/general/firebase_types.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/streams.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AccountStore {
  late final Stream<RawFirebaseDocumentSnapshot?> _currentUserStream =
      ValueConnectableStream(createCurrentUserStream()).autoConnect();
  Stream<RawFirebaseDocumentSnapshot?> get currentUserStream =>
      _currentUserStream;

  Stream<RawFirebaseDocumentSnapshot?> createCurrentUserStream() {
    return FirebaseAuth.instance
        .userChanges()
        .switchMap(_mapUserToMemberIdStream)
        .switchMap(_mapMemberIdToMemberSnapshotStream);
  }

  Stream<String?> _mapUserToMemberIdStream(User? user) {
    if (user == null) {
      return Stream.value(null);
    } else {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots()
          .map<String?>((data) => data.data()?['memberId']);
    }
  }

  Stream<RawFirebaseDocumentSnapshot?> _mapMemberIdToMemberSnapshotStream(
      String? memberId) {
    if (memberId == null) {
      return Stream.value(null);
    } else {
      return FirebaseFirestore.instance
          .collection('members')
          .doc(memberId)
          .snapshots();
    }
  }

  Future<void> signin() async {
    final microsoftProvider = MicrosoftAuthProvider();
    microsoftProvider.setCustomParameters({
      'tenant': '2ea9aa7a-5a05-49cb-8307-63467188daa2',
    });

    if (kIsWeb) {
      await FirebaseAuth.instance.signInWithPopup(microsoftProvider);
    } else {
      await FirebaseAuth.instance.signInWithProvider(microsoftProvider);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
