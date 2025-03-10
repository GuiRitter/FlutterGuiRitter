import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_guiritter/extension/date_time.dart';

dynamic getExistsMark(
  dynamic value,
) =>
    (value != null) ? {} : null;

String hideSecret(
  dynamic text,
) {
  if (text == null) {
    return "null";
  }
  return "length: ${text.toString().length}";
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

  Log({
    required this.fileName,
    required this.methodName,
  });

  Log asString(
    String key,
    dynamic value,
  ) {
    argumentMap[key] = value?.toString();
    return this;
  }

  Log enum_(
    String key,
    Enum? value,
  ) {
    argumentMap[key] = value?.name;
    return this;
  }

  Log exists(
    String key,
    dynamic value,
  ) {
    argumentMap[key] = getExistsMark(
      value,
    );
    return this;
  }

  Log existsList(
    String key,
    List<dynamic>? value,
  ) {
    argumentMap[key] = (value != null) ? value.length : null;
    return this;
  }

  // Log json(
  //   String key,
  //   dynamic value,
  // ) {
  //   argumentMap[key] = jsonEncode(
  //     value,
  //   );
  //   return this;
  // }

  Log map(
    String key,
    Loggable? value,
  ) {
    argumentMap[key] = value?.asLog();
    return this;
  }

  void print() => debugPrint(
        "${jsonEncode(
          <String, dynamic>{
            "dateTime": DateTime.now().toISO8601WithTimeZoneString(),
            "file": fileName,
            "method": methodName,
            ...argumentMap,
          },
        )},",
      );

  Log raw(
    String key,
    dynamic value,
  ) {
    argumentMap[key] = value;
    return this;
  }

  Log secret(
    String key,
    dynamic value,
  ) {
    argumentMap[key] = hideSecret(
      value,
    );
    return this;
  }
}

abstract class Loggable {
  Map<String, dynamic> asLog();
}
