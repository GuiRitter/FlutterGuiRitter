import 'package:flutter_guiritter/common/_import.dart' show Settings;
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

const humanReadableDateTimeFormat = "yyyy-LLL-dd (E) HH:mm";

final humanReadableDateFormatMap = <String, DateFormat>{};

final iso8601TimeZoneOffsetHourFormat = NumberFormat(
  "+00;-00",
);

final iso8601TimeZoneOffsetMinuteFormat = NumberFormat(
  "00",
);

final timeFormat = NumberFormat(
  '00',
);

DateFormat get dateOnlyFormat => DateFormat(
      'y-MM-dd',
      Settings.locale,
    );

String getISO8601TimeZone({
  required int timeZoneOffsetInMinutes,
}) {
  var hour = timeZoneOffsetInMinutes ~/ 60;
  var minute = timeZoneOffsetInMinutes % 60;

  return '${NumberFormat(
    '+00;-00',
  ).format(
    hour,
  )}:${NumberFormat(
    '00',
  ).format(
    minute,
  )}';
}
