import 'package:domain/storage/repository/storage_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDarkTheme {
  final StorageRepository repository;

  const GetDarkTheme(this.repository);

  Stream<bool?> call() => repository.getDarkThemeStream();
}
