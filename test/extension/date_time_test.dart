import 'package:flutter_guiritter/extension/date_time.dart';
import 'package:flutter_test/flutter_test.dart'
    show test, group, expect, setUpAll;
import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;

void main() {
  setUpAll(
    () {
      initializeDateFormatting();
    },
  );

  group(
    'date_time buildHumanReadableDateFormat',
    () {
      for (var testCase in localeTestCaseList) {
        test(
          'for locale ${testCase.input}}',
          () {
            final locale = testCase.input;

            final expected = testCase.expected;

            final format = locale.buildHumanReadableDateFormat();

            final output = format.format(
              flutterFirstCommitDateTime,
            );

            expect(
              output,
              expected,
            );
          },
        );
      }
    },
  );

  group(
    'date_time getHumanReadableDateFormat',
    () {
      for (var testCase in localeTestCaseList) {
        test(
          'for locale ${testCase.input}}',
          () {
            final locale = testCase.input;

            final expected = testCase.expected;

            final format = locale.getHumanReadableDateFormat();

            final output = format.format(
              flutterFirstCommitDateTime,
            );

            expect(
              output,
              expected,
            );
          },
        );
      }
    },
  );

  group(
    'date_time toHumanReadableString',
    () {
      for (var testCase in localeTestCaseList) {
        test(
          'for locale ${testCase.input}}',
          () {
            final locale = testCase.input;

            final expected = testCase.expected;

            final output = flutterFirstCommitDateTime.toHumanReadableString(
              locale: locale,
            );

            expect(
              output,
              expected,
            );
          },
        );
      }
    },
  );
}

final flutterFirstCommitDateTime = DateTime(
  2013,
  4,
  19,
  17,
  28,
);

final localeTestCaseList = [
  _TestCase(
    input: 'en',
    expected: '2013-Apr-19 (Fri) 17:28',
  ),
  _TestCase(
    input: 'pt',
    expected: '2013-abr.-19 (sex.) 17:28',
  ),
];

final timeZoneTestCaseList = [
  _TestCase(
    input: '2013-04-19T14:28:00-03:00',
    expected: '-03:00',
  ),
  _TestCase(
    input: '2013-04-19T06:13:00+12:45',
    expected: '+12:45',
  ),
];

class _TestCase {
  final String input;
  final String expected;

  _TestCase({
    required this.input,
    required this.expected,
  });
}
