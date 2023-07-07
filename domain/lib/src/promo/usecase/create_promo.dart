import 'package:domain/promo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreatePromo {
  final PromoRepository _repository;

  const CreatePromo(this._repository);

  Future<void> call(CreatePromoModel model) async {
    return _repository.createPromo(model);
  }
}
