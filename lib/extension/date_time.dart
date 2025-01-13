import 'package:intl/intl.dart';

final humanReadableDateFormatMap = <String, DateFormat>{};

String humanReadableDateTimeFormat = "yyyy-LLL-dd (E) HH:mm";

extension DateTimeExtension on DateTime {
  /// [locale] is `en` for English, `pt` for Portuguese etc.
  String toHumanReadableString({
    required String locale,
  }) =>
      locale.getHumanReadableDateFormat().format(
            this,
          );
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
