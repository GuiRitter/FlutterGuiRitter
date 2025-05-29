import 'package:flutter/material.dart' show TimeOfDay;
import 'package:flutter_guiritter/common/_import.dart' show Settings;
import 'package:flutter_guiritter/util/_import.dart'
    show
        dateOnlyFormat,
        getISO8601TimeZone,
        humanReadableDateTimeFormat,
        humanReadableDateFormatMap,
        iso8601TimeZoneOffsetHourFormat,
        iso8601TimeZoneOffsetMinuteFormat,
        timeFormat;
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime getThisIfNullOrEarlier({
    required DateTime? other,
  }) =>
      (other == null)
          ? this
          : (other.compareTo(
                    this,
                  ) <
                  0)
              ? other
              : this;

  DateTime getThisIfNullOrLater({
    required DateTime? other,
  }) =>
      (other == null)
          ? this
          : (other.compareTo(
                    this,
                  ) >
                  0)
              ? other
              : this;

  /// [locale] is `en` for English, `pt` for Portuguese etc.
  String toHumanReadableString({
    required String locale,
  }) =>
      locale.getHumanReadableDateFormat().format(
            this,
          );

  String toISO8601TimeZoneString() => timeZoneOffset.toISO8601TimeZoneString();
}

extension DateTimeNullableExtension on DateTime? {
  String? getISO8601() {
    if (this == null) return null;

    return DateFormat(
      '${this!.toIso8601String()}${getISO8601TimeZone(
        timeZoneOffsetInMinutes: this!.timeZoneOffset.inMinutes,
      )}',
      Settings.locale,
    ).format(
      this!,
    );
  }

  String? getISO8601Date() {
    if (this == null) return null;

    return dateOnlyFormat.format(
      this!,
    );
  }

  String? getISO8601Time() {
    if (this == null) return null;

    return '${timeFormat.format(
      this!.hour,
    )}:${timeFormat.format(
      this!.minute,
    )}';
  }

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

extension DurationExtension on Duration {
  String toISO8601TimeZoneString() {
    var hour = inMinutes ~/ 60;
    var minute = inMinutes % 60;

    return "${iso8601TimeZoneOffsetHourFormat.format(
      hour,
    )}:${iso8601TimeZoneOffsetMinuteFormat.format(
      minute,
    )}";
  }
}

extension TimeOfDayNullableExtension on TimeOfDay? {
  String? getISO8601Time() {
    if (this == null) return null;

    return '${timeFormat.format(
      this!.hour,
    )}:${timeFormat.format(
      this!.minute,
    )}';
  }
}
