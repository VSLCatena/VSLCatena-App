import 'package:domain/promo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePromo {
  final PromoRepository _repository;

  const UpdatePromo(this._repository);

  Future<void> call(UpdatePromoModel model) async {
    return _repository.updatePromo(model);
  }
}
