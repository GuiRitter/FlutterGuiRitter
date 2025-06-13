import 'package:flutter_guiritter/model/_import.dart';

extension DynamicListExtension on dynamic {
  List<T> ofDynamic<T>({
    required T Function(
      dynamic json,
    ) mapper,
  }) =>
      (this as List<dynamic>)
          .map(
            mapper,
          )
          .toList();
}

extension EncodableListExtension on List<Encodable> {
  List<dynamic> toJson() => map(
        (
          item,
        ) =>
            item.toJson(),
      ).toList();
}

extension MapExtension<K, V> on Map<K, V> {
  V? getValueOrNew({
    required K key,
    required V Function() generator,
  }) {
    if (containsKey(
      key,
    )) {
      return this[key];
    } else {
      final value = generator();
      this[key] = value;
      return value;
    }
  }
}
