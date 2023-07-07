import 'package:domain/promo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeletePromo {
  final PromoRepository _repository;

  const DeletePromo(this._repository);

  Future<void> call(String id) async {
    return _repository.deletePromo(id);
  }
}
