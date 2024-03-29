import 'package:domain/account.dart';
import 'package:injectable/injectable.dart';

@injectable
class Logout {
  final AccountRepository repository;
  const Logout(this.repository);

  Future<void> call() => repository.logout();
}
