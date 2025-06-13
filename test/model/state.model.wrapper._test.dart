import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/model/_import.dart'
    show LoadingTagModel, StateModelWrapper;
import 'package:flutter_test/flutter_test.dart' show expect, test;

void main() {
  test(
    'serialize and back',
    () async {
      final stateDeserializedExpected = {
        'l10n': null,
        'l10nGuiRitter': null,
        'themeMode': ThemeMode.dark,
        'loadingTagList': <LoadingTagModel>[],
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dnZWRJbkFzIjoiYWRtaW4iLCJpYXQiOjE0MjI3Nzk2Mzh9.gzSraSYS8EXBxLN _oWnFSRgCzcmJmMjLiuyu5CSpyHI='
      };

      final state = StateModelWrapper(
        storeStateMap: stateDeserializedExpected,
      );

      final stateSerializedActual = state.serialize();
      const stateSerializedExpected =
          '{"l10n":null,"l10nGuiRitter":null,"themeMode":"dark","loadingTagList":[],"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dnZWRJbkFzIjoiYWRtaW4iLCJpYXQiOjE0MjI3Nzk2Mzh9.gzSraSYS8EXBxLN _oWnFSRgCzcmJmMjLiuyu5CSpyHI="}';

      expect(
        stateSerializedActual,
        stateSerializedExpected,
        reason: 'serialized',
      );

      final stateDeserializedActual = StateModelWrapper.deserialize(
        serialized: stateSerializedExpected,
      ).storeStateMap;

      expect(
        stateDeserializedActual,
        stateDeserializedExpected,
        reason: 'deserialized',
      );
    },
  );
}
