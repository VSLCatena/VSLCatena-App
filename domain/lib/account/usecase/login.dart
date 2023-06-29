import 'package:domain/account/repository/account_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class Login {
  final AccountRepository repository;
  const Login(this.repository);

  Future<void> call() => repository.login();
}
