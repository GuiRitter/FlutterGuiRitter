import 'package:intl/intl.dart';

const humanReadableDateTimeFormat = "yyyy-LLL-dd (E) HH:mm";

final humanReadableDateFormatMap = <String, DateFormat>{};

final iso8601TimeZoneOffsetHourFormat = NumberFormat(
  "+00;-00",
);

final iso8601TimeZoneOffsetMinuteFormat = NumberFormat(
  "00",
);

extension DateTimeExtension on DateTime {
  /// [locale] is `en` for English, `pt` for Portuguese etc.
  String toHumanReadableString({
    required String locale,
  }) =>
      locale.getHumanReadableDateFormat().format(
            this,
          );

  String toISO8601TimeZoneString() {
    final timeZoneOffsetInMinutes = timeZoneOffset.inMinutes;

    var hour = timeZoneOffsetInMinutes ~/ 60;
    var minute = timeZoneOffsetInMinutes % 60;

    return "${iso8601TimeZoneOffsetHourFormat.format(
      hour,
    )}:${iso8601TimeZoneOffsetMinuteFormat.format(
      minute,
    )}";
  }
}

extension DateTimeNullableExtension on DateTime? {
  String? toISO8601WithTimeZoneString() {
    if (this == null) {
      return null;
    }

    return DateFormat(
      "${this!.toIso8601String()}${this!.toISO8601TimeZoneString()}",
    ).format(
      this!,
    );
  }
}

extension DateTimeStringExtension on String {
  DateFormat buildHumanReadableDateFormat() => DateFormat(
        humanReadableDateTimeFormat,
        this,
      );

  DateFormat getHumanReadableDateFormat() =>
      humanReadableDateFormatMap.putIfAbsent(
        this,
        buildHumanReadableDateFormat,
      );
}
