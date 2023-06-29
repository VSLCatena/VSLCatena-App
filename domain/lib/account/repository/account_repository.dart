import 'dart:io';

import '../../association/model/member.dart';

abstract interface class AccountRepository {
  Stream<Member?> currentUser();

  Future<void> login();

  Future<void> logout();

  Future<void> updateProfilePicture(File image);
}
