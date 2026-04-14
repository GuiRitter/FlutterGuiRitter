import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/model/_import.dart'
    show LoadingTagModel, StateModelWrapperOld;
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

      final stateOld = StateModelWrapperOld(
        storeStateMap: stateDeserializedExpected,
      );

      final stateSerializedActualOld = stateOld.serialize();
      const stateSerializedExpected =
          '{"l10n":null,"l10nGuiRitter":null,"themeMode":"dark","loadingTagList":[],"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dnZWRJbkFzIjoiYWRtaW4iLCJpYXQiOjE0MjI3Nzk2Mzh9.gzSraSYS8EXBxLN _oWnFSRgCzcmJmMjLiuyu5CSpyHI="}';

      expect(
        stateSerializedActualOld,
        stateSerializedExpected,
        reason: 'serialized',
      );

      final stateDeserializedActualOld = StateModelWrapperOld.deserialize(
        serialized: stateSerializedExpected,
      ).storeStateMap;

      expect(
        stateDeserializedActualOld,
        stateDeserializedExpected,
        reason: 'deserialized',
      );
    },
  );
}
