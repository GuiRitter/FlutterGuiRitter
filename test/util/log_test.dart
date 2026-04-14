import 'package:flutter_guiritter/util/_import.dart' show logger;
import 'package:flutter_test/flutter_test.dart' show setUpAll, test;
import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;

void main() {
  setUpAll(
    () {
      initializeDateFormatting();
    },
  );

  test('log of map', () async {
    final map = {
      'a': 1,
      'b': 2,
    };

    _log('test').raw('map', map).print();
  });
}

final _log = logger('test');
