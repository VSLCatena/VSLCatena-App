import 'package:flutter_bloc/flutter_bloc.dart';

import '../datasource/member_data_source.dart';
import '../datasource/member_data_source_factory.dart';

class MemberListCubit extends Cubit<MemberDataSource> {
  MemberListCubit(MemberDataSourceFactory factory) : super(factory.create());
}
