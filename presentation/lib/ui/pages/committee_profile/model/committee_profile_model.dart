import 'package:domain/general/model/async_image.dart';
import 'package:presentation/ui/widget/member/model/member_model.dart';

class CommitteeProfileModel {
  final String name;
  final String? email;
  final String? description;
  final AsyncImage? image;
  final List<MemberModel> members;

  const CommitteeProfileModel({
    required this.name,
    required this.email,
    required this.description,
    required this.image,
    required this.members,
  });
}
