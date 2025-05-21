import 'package:flutter/material.dart'
    show
        BuildContext,
        Icon,
        Icons,
        ListTile,
        Navigator,
        StatelessWidget,
        Text,
        ThemeMode,
        Widget;
import 'package:flutter_guiritter/common/common.import.dart' show Settings;
import 'package:flutter_guiritter/redux/redux.import.dart' show dispatch;
import 'package:flutter_guiritter/redux/theme/action.dart' as theme_action
    show ThemeAction;
import 'package:flutter_guiritter/redux/theme/selector.dart' show themeSelector;
import 'package:flutter_guiritter/util/util.import.dart' show logger;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

final _log = logger('ThemeOptionWidget');

class ThemeOptionWidget<AppLocalizationsLocalType> extends StatelessWidget {
  final ThemeMode themeMode;
  final String title;

  const ThemeOptionWidget({
    super.key,
    required this.themeMode,
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      StoreConnector<Map<String, dynamic>, ThemeMode>(
        distinct: true,
        converter: themeSelector,
        builder: connectorBuilder,
      );

  Widget connectorBuilder(
    BuildContext context,
    ThemeMode themeModeCurrent,
  ) =>
      ListTile(
        onTap: () => onThemeTapped(
          context: context,
          themeMode: themeMode,
        ),
        title: Text(
          title,
        ),
        trailing: Icon(
          (themeModeCurrent == themeMode)
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked,
        ),
      );

  onThemeTapped({
    required BuildContext context,
    required ThemeMode themeMode,
  }) {
    _log('onThemeTapped').enum_('themeMode', themeMode).print();

    dispatch(
      theme_action.ThemeAction(
        themeMode: themeMode,
      ),
    );

    SharedPreferences.getInstance().then(
      (
        prefs,
      ) {
        prefs.setString(
          Settings.themeKey,
          themeMode.name,
        );
      },
    );

    Navigator.pop(
      context,
    );
  }
}
