import 'package:domain/storage/repository/storage_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetDarkTheme {
  final StorageRepository repository;

  const SetDarkTheme(this.repository);

  Future<void> call(bool? darkTheme) => repository.setDarkTheme(darkTheme);
}
