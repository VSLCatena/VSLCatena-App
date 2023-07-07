import 'package:domain/account.dart';
import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentUser {
  final AccountRepository repository;
  const GetCurrentUser(this.repository);

  Stream<Member?> call() => repository.currentUser();
}
