import 'package:domain/account.dart';
import 'package:injectable/injectable.dart';

@injectable
class Login {
  final AccountRepository repository;
  const Login(this.repository);

  Future<void> call() => repository.login();
}
