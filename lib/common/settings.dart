import 'package:flutter/material.dart';
import 'package:flutter_guiritter/l10n/app_localizations.dart'
    show AppLocalizationsGuiRitter;

final l10nNotifierGuiRitter = ValueNotifier<AppLocalizationsGuiRitter?>(
  null,
);

AppLocalizationsGuiRitter? get l10nGuiRitter => l10nNotifierGuiRitter.value;

set l10nGuiRitter(AppLocalizationsGuiRitter? appL10ns) {
  l10nNotifierGuiRitter.value = appL10ns;
}

class Settings {
  static const themeKey = 'theme';
}
