import 'dart:io';

import 'package:domain/account/repository/account_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfilePicture {
  final AccountRepository repository;
  const UpdateProfilePicture(this.repository);

  Future<void> call(File file) => repository.updateProfilePicture(file);
}
