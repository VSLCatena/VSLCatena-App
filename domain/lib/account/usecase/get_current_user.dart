import 'package:domain/account/repository/account_repository.dart';
import 'package:domain/association/model/member.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentUser {
  final AccountRepository repository;
  const GetCurrentUser(this.repository);

  Stream<Member?> call() => repository.currentUser();
}
