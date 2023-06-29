import 'package:domain/account/repository/account_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class Logout {
  final AccountRepository repository;
  const Logout(this.repository);

  Future<void> call() => repository.logout();
}
