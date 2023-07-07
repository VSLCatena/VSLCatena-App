import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../l10n/generated/app_localizations.dart';

@injectable
class DateTimeMapper {
  String map(
    BuildContext context,
    DateTime date, {
    bool showWeekday = false,
    bool showDate = true,
    bool showTime = true,
    bool showSeconds = false,
    bool smartYear = true,
  }) {
    List<String> dateComponents = [];

    if (showDate) {
      if (showWeekday) {
        dateComponents.add(_mapDayString(context, date.weekday));
      }

      dateComponents.add(_mapDateString(context, date, smartYear));
    }

    if (showDate && showTime) {
      dateComponents.add(AppLocalizations.of(context)!.dateTimeSeparator);
    }

    if (showTime) {
      dateComponents.add(_mapTimeString(date, showSeconds));
    }

    return dateComponents.join(' ');
  }

  String _mapDateString(BuildContext context, DateTime date, bool smartYear) {
    final appLoc = AppLocalizations.of(context)!;
    final month = switch (date.month) {
      DateTime.january => appLoc.monthJanuary,
      DateTime.february => appLoc.monthFebruary,
      DateTime.march => appLoc.monthMarch,
      DateTime.april => appLoc.monthApril,
      DateTime.may => appLoc.monthMay,
      DateTime.june => appLoc.monthJune,
      DateTime.july => appLoc.monthJuly,
      DateTime.august => appLoc.monthAugust,
      DateTime.september => appLoc.monthSeptember,
      DateTime.october => appLoc.monthOctober,
      DateTime.november => appLoc.monthNovember,
      DateTime.december => appLoc.monthDecember,
      _ => throw Exception('How is this even possible?'),
    };

    if (smartYear && DateTime.now().year == date.year) {
      return '${date.day} $month';
    } else {
      return '${date.day} $month ${date.year}';
    }
  }

  String _mapTimeString(DateTime time, bool showSeconds) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');

    if (showSeconds) {
      final second = time.second.toString().padLeft(2, '0');
      return '$hour:$minute:$second';
    } else {
      return '$hour:$minute';
    }
  }

  String _mapDayString(BuildContext context, int day) {
    final appLoc = AppLocalizations.of(context)!;
    return switch (day) {
      DateTime.monday => appLoc.dayMonday,
      DateTime.tuesday => appLoc.dayTuesday,
      DateTime.wednesday => appLoc.dayWednesday,
      DateTime.thursday => appLoc.dayThursday,
      DateTime.friday => appLoc.dayFriday,
      DateTime.saturday => appLoc.daySaturday,
      DateTime.sunday => appLoc.daySunday,
      _ => throw Exception('what day is this?'),
    };
  }
}
