import 'package:flutter_guiritter/util/util.import.dart' show StringComparator;
import 'package:flutter_test/flutter_test.dart' show expect, test;

void main() {
  test(
    'l10n comes before list',
    () {
      expect(
        StringComparator.compare(
          alpha: 'l10n',
          bravo: 'list',
        ),
        -1,
      );
    },
  );
}
