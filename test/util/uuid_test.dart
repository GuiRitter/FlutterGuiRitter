import 'package:flutter_guiritter/util/uuid.dart' show buildUUID;
import 'package:flutter_test/flutter_test.dart' show expect, test;

void main() {
  test(
    'do I need to build a new instance of the library\'s Uuid class?',
    () {
      var v4Crypto0 = buildUUID();
      var v4Crypto1 = buildUUID();

      expect(
        v4Crypto0 != v4Crypto1,
        true,
        reason: 'no I don\'t',
      );
    },
  );
}
