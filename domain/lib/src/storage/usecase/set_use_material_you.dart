import 'package:domain/storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetUseMaterialYou {
  final StorageRepository repository;

  const SetUseMaterialYou(this.repository);

  Future<void> call(bool darkTheme) => repository.setUseMaterialYou(darkTheme);
}
