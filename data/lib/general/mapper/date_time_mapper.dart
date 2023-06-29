import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class DateTimeMapper {
  DateTime map(Timestamp timestamp) => timestamp.toDate();
}
