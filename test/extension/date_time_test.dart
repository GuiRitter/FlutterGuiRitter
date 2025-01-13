import 'package:flutter_guiritter/extension/date_time.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(
    () {
      initializeDateFormatting();
    },
  );

  group(
    'date_time buildHumanReadableDateFormat',
    () {
      final testCaseList = [
        {
          'locale': 'en',
          'expected': '2013-Apr-19 (Fri) 17:28',
        },
        {
          'locale': 'pt',
          'expected': '2013-abr.-19 (sex.) 17:28',
        },
      ];

      for (var testCase in testCaseList) {
        test(
          'for locale ${testCase['locale']}}',
          () {
            final locale = testCase['locale'] as String;

            final dateTime = DateTime(
              2013,
              4,
              19,
              17,
              28,
            );

            final expected = testCase['expected'] as String;

            final format = locale.buildHumanReadableDateFormat();

            final output = format.format(
              dateTime,
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
      final testCaseList = [
        {
          'locale': 'en',
          'expected': '2013-Apr-19 (Fri) 17:28',
        },
        {
          'locale': 'pt',
          'expected': '2013-abr.-19 (sex.) 17:28',
        },
      ];

      for (var testCase in testCaseList) {
        test(
          'for locale ${testCase['locale']}}',
          () {
            final locale = testCase['locale'] as String;

            final dateTime = DateTime(
              2013,
              4,
              19,
              17,
              28,
            );

            final expected = testCase['expected'] as String;

            final format = locale.getHumanReadableDateFormat();

            final output = format.format(
              dateTime,
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
      final testCaseList = [
        {
          'locale': 'en',
          'expected': '2013-Apr-19 (Fri) 17:28',
        },
        {
          'locale': 'pt',
          'expected': '2013-abr.-19 (sex.) 17:28',
        },
      ];

      for (var testCase in testCaseList) {
        test(
          'for locale ${testCase['locale']}}',
          () {
            final locale = testCase['locale'] as String;

            final dateTime = DateTime(
              2013,
              4,
              19,
              17,
              28,
            );

            final expected = testCase['expected'] as String;

            final output = dateTime.toHumanReadableString(
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
