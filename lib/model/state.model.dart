import 'package:flutter/material.dart' show ValueGetter;
import 'package:flutter_guiritter/common/common.import.dart'
    show AppLocalizationsGuiRitter;

class StateModel<AppLocalizationsLocalType> {
  final AppLocalizationsGuiRitter? l10nGuiRitter;
  final AppLocalizationsLocalType? l10n;

  StateModel({
    required this.l10nGuiRitter,
    required this.l10n,
  });

  StateModel copyWith({
    ValueGetter<AppLocalizationsGuiRitter?>? l10nGuiRitter,
    ValueGetter<AppLocalizationsLocalType?>? l10n,
  }) {
    final newL10nGuiRitter =
        (l10nGuiRitter != null) ? l10nGuiRitter.call() : this.l10nGuiRitter;

    final newL10n = (l10n != null) ? l10n.call() : this.l10n;

    return StateModel(
      l10nGuiRitter: newL10nGuiRitter,
      l10n: newL10n,
    );
  }
}
