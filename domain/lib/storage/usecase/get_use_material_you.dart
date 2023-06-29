import 'package:domain/storage/repository/storage_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUseMaterialYou {
  final StorageRepository repository;

  const GetUseMaterialYou(this.repository);

  Stream<bool> call() => repository.getUseMaterialYouStream();
}
