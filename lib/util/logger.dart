import 'dart:convert' show jsonEncode;

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_guiritter/extension/_import.dart'
    show DateTimeNullableExtension;
import 'package:flutter_guiritter/model/_import.dart' show Loggable;

dynamic getExistsMark(
  dynamic value,
) =>
    (value != null) ? {} : null;

String? hideSecret(
  dynamic text,
) {
  if (text == null) {
    return null;
  }
  return 'length: ${text.toString().length}';
}

Log Function(
  String methodName,
) logger(
  String fileName,
) =>
    (
      String methodName,
    ) =>
        Log(
          fileName: fileName,
          methodName: methodName,
        );

class Log {
  final String fileName;
  final String methodName;
  final argumentMap = <String, dynamic>{};
  String headerKey = '';

  Log({
    required this.fileName,
    required this.methodName,
  });

  void addToMap({
    required String key,
    required dynamic value,
  }) {
    final keyList = argumentMap.keys.toList() + [key].toList();

    while (keyList.contains(
      headerKey,
    )) {
      headerKey += '_';
    }

    argumentMap[key] = value;
  }

  Log asString(
    String key,
    dynamic value,
  ) {
    addToMap(
      key: key,
      value: value?.toString(),
    );

    return this;
  }

  Log enum_(
    String key,
    Enum? value,
  ) {
    addToMap(
      key: key,
      value: value?.name,
    );

    return this;
  }

  Log exists(
    String key,
    dynamic value,
  ) {
    addToMap(
      key: key,
      value: getExistsMark(
        value,
      ),
    );

    return this;
  }

  Log existsList(
    String key,
    List<dynamic>? value,
  ) {
    addToMap(
      key: key,
      value: (value != null) ? value.length : null,
    );

    return this;
  }

  // Log json(
  //   String key,
  //   dynamic value,
  // ) {
  //   addToMap(
  //     key: key,
  //     value: jsonEncode(
  //       value,
  //     ),
  //   );

  //   return this;
  // }

  Log map(
    String key,
    Loggable? value,
  ) {
    addToMap(
      key: key,
      value: value?.asLog(),
    );

    return this;
  }

  Log mapList(
    String key,
    List<Loggable?>? value,
  ) {
    addToMap(
      key: key,
      value: value
          ?.map(
            toLog,
          )
          .toList(),
    );

    return this;
  }

  void print() => debugPrint(
        '${jsonEncode(
          <String, dynamic>{
            headerKey: {
              'dateTime': DateTime.now().getISO8601(),
              'file': fileName,
              'method': methodName,
            },
            ...argumentMap,
          },
        )},',
      );

  Log raw(
    String key,
    dynamic value,
  ) {
    addToMap(
      key: key,
      value: value,
    );

    return this;
  }

  Log secret(
    String key,
    dynamic value,
  ) {
    addToMap(
      key: key,
      value: hideSecret(
        value,
      ),
    );

    return this;
  }

  Map<String, dynamic>? toLog(
    Loggable? loggableModel,
  ) =>
      loggableModel?.asLog();
}
