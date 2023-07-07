import 'package:domain/association.dart';
import 'package:injectable/injectable.dart';

import '../model/committee_model.dart';

@injectable
class CommitteeMapper {
  CommitteeModel map(Committee committee) {
    return CommitteeModel(
      id: committee.id,
      name: committee.name,
      email: committee.email,
      description: committee.description,
      image: committee.image,
    );
  }
}
