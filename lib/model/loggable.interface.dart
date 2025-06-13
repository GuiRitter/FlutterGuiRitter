Map<String, dynamic> toLog(
  Loggable item,
) =>
    item.asLog();

abstract class Loggable {
  Map<String, dynamic> asLog();
}

extension LoggableSetExtension on Set<Loggable> {
  List<Map<String, dynamic>> asLog() => toList()
      .map(
        toLog,
      )
      .toList();
}
