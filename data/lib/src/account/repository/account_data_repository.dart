import 'dart:io';

import 'package:domain/account.dart';
import 'package:domain/association.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import '../../generic/firebase_types.dart';
import '../../association/mapper/member_mapper.dart';
import '../store/account_store.dart';

@Injectable(as: AccountRepository)
class AccountDataRepository implements AccountRepository {
  final AccountStore _accountStore;
  final GetCommittees _getCommittees;
  final MemberMapper _memberMapper;

  const AccountDataRepository(
      this._accountStore, this._getCommittees, this._memberMapper);

  @override
  Stream<Member?> currentUser() =>
      _accountStore.currentUserStream.asyncMap(_mapMemberSnapshotToMember);

  @override
  Future<void> login() async {
    return await _accountStore.signIn();
  }

  @override
  Future<void> logout() async {
    return await _accountStore.signOut();
  }

  @override
  Future<void> updateProfilePicture(File file) async {
    final userId = (await currentUser().first)!.id;
    await FirebaseStorage.instance
        .ref()
        .child("members/$userId/profile.jpg")
        .putFile(file);
  }

  Future<Member?> _mapMemberSnapshotToMember(
    RawFirebaseDocumentSnapshot? data,
  ) async {
    if (data == null) return null;

    final committees = await _getCommittees();
    return _memberMapper.map(data, committees);
  }
}
