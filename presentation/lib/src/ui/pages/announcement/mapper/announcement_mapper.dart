import 'package:domain/announcement.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/mapper/date_time_mapper.dart';
import '../../../widget/member/mapper/member_mapper.dart';
import '../model/announcement_model.dart';

@injectable
class AnnouncementMapper {
  final MemberMapper _memberMapper;
  final DateTimeMapper _dateTimeMapper;

  const AnnouncementMapper(this._memberMapper, this._dateTimeMapper);

  AnnouncementModel map(BuildContext context, Announcement announcement) {
    return AnnouncementModel(
      title: announcement.title,
      content: announcement.content,
      dateText:
          _dateTimeMapper.map(context, announcement.date, showSeconds: true),
      user: _memberMapper.map(announcement.member),
    );
  }
}
