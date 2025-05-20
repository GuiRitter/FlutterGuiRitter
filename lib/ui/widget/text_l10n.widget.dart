import 'package:flutter/material.dart'
    show BuildContext, Key, StatelessWidget, Text, TextAlign, TextStyle, Widget;
import 'package:flutter_guiritter/common/common.import.dart'
    show AppLocalizationsGuiRitter;
import 'package:flutter_guiritter/model/model.import.dart' show L10nModel;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

class TextL10n<AppLocalizationsLocalType> extends StatelessWidget {
  final String Function(
    AppLocalizationsGuiRitter?,
  )? l10nGuiRitterSelector;

  final String Function(
    AppLocalizationsLocalType?,
  )? l10nSelector;

  final TextStyle? style;
  final TextAlign? textAlign;

  const TextL10n({
    super.key,
    this.l10nGuiRitterSelector,
    this.l10nSelector,
    this.style,
    this.textAlign,
  });

  factory TextL10n.g(
    String Function(
      AppLocalizationsGuiRitter?,
    )? l10nGuiRitterSelector, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return TextL10n<AppLocalizationsLocalType>(
      key: key,
      l10nGuiRitterSelector: l10nGuiRitterSelector,
      style: style,
      textAlign: textAlign,
    );
  }

  factory TextL10n.l(
    String Function(
      AppLocalizationsLocalType?,
    )? l10nSelector, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return TextL10n<AppLocalizationsLocalType>(
      key: key,
      l10nSelector: l10nSelector,
      style: style,
      textAlign: textAlign,
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) =>
      StoreConnector<Map<String, dynamic>,
          L10nModel<AppLocalizationsLocalType>>(
        distinct: true,
        converter: L10nModel.select<AppLocalizationsLocalType>,
        builder: connectorBuilder,
      );

  Widget connectorBuilder(
    BuildContext context,
    L10nModel<AppLocalizationsLocalType> l10nModel,
  ) {
    return Text(
      getText(
        l10nModel,
      ),
      style: style,
      textAlign: textAlign,
    );
  }

  String getText(
    L10nModel<AppLocalizationsLocalType> l10nModel,
  ) =>
      (l10nGuiRitterSelector != null)
          ? l10nGuiRitterSelector!(l10nModel.l10nGuiRitter!)
          : (l10nSelector != null)
              ? l10nSelector!(l10nModel.l10n)
              : "";
}
