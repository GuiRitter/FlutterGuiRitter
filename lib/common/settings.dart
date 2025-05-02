import 'package:flutter/material.dart';
import 'package:flutter_guiritter/l10n/app_localizations.dart'
    show AppLocalizationsGuiRitter;
import 'package:flutter_guiritter/service/dio/dio_for_any.interface.dart'
    show DioForAny;

const appName = String.fromEnvironment(
  'APP_NAME',
);

const base64Prefix = 'data:image/png;base64,';

final l10nNotifierGuiRitter = ValueNotifier<AppLocalizationsGuiRitter?>(
  null,
);

final navigatorState = GlobalKey<NavigatorState>();

final snackState = GlobalKey<ScaffoldMessengerState>();

AppLocalizationsGuiRitter? get l10nGuiRitter => l10nNotifierGuiRitter.value;

set l10nGuiRitter(AppLocalizationsGuiRitter? appL10ns) {
  l10nNotifierGuiRitter.value = appL10ns;
}

class Settings {
  static final api = DioForAny();

  static const apiUrl = '$protocol://$domain$port/$path/';

  static const dataKey = 'data';

  static const domain = 'guilherme-alan-ritter.net';

  static const errorKey = 'error';

  static String locale = const Locale.fromSubtags(
    languageCode: "en",
  ).toString();

  static const path = '$appName/api';

  static const port = '';

  static const protocol = 'https';

  static const revalidateToken = 'REVALIDATE_TOKEN';

  static const themeKey = 'theme';

  static const tokenKey = 'token';
}
