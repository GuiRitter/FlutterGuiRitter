import 'package:flutter_guiritter/common/_import.dart'
    show AppLocalizationsGuiRitter;
import 'package:flutter_guiritter/model/_import.dart' show Loggable;

class L10nModel<AppLocalizationsLocalType> implements Loggable {
  final AppLocalizationsGuiRitter? l10nGuiRitter;
  final AppLocalizationsLocalType? l10n;

  L10nModel({
    required this.l10nGuiRitter,
    required this.l10n,
  });

  @override
  int get hashCode => Object.hash(
        l10nGuiRitter,
        l10n,
      );

  @override
  bool operator ==(
    Object other,
  ) {
    if (other is! L10nModel<AppLocalizationsLocalType>) {
      return false;
    }
    return (l10nGuiRitter == other.l10nGuiRitter) && (l10n == other.l10n);
  }

  @override
  Map<String, dynamic> asLog() => <String, dynamic>{
        'l10nGuiRitter': l10nGuiRitter,
        'l10n': l10n,
      };
}
