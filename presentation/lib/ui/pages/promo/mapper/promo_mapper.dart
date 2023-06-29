import 'package:domain/promo/model/promo.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../utils/mapper/date_time_mapper.dart';
import '../../../widget/member/mapper/member_mapper.dart';
import '../model/promo_model.dart';

@injectable
class PromoMapper {
  final MemberMapper _memberMapper;
  final DateTimeMapper _dateTimeMapper;

  const PromoMapper(this._memberMapper, this._dateTimeMapper);

  PromoModel map(BuildContext context, Promo promo) {
    return PromoModel(
      title: promo.title,
      content: promo.content,
      dateText: _dateTimeMapper.map(context, promo.date, showSeconds: true),
      user: _memberMapper.map(promo.member),
    );
  }
}
