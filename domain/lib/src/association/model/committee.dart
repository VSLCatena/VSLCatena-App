import 'package:domain/generic.dart';

class Committee {
  final String id;
  final String name;
  final String? description;
  final String? email;
  final AsyncImage? image;

  const Committee({
    required this.id,
    required this.name,
    required this.description,
    required this.email,
    required this.image,
  });
}
