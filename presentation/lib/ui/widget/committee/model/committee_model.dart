import 'package:domain/general/model/async_image.dart';

class CommitteeModel {
  final String id;
  final String name;
  final String? email;
  final String? description;
  final AsyncImage? image;

  const CommitteeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.description,
    required this.image,
  });
}
