import 'package:flutter/material.dart'
    show
        BuildContext,
        InputDecoration,
        StatelessWidget,
        TextEditingController,
        TextFormField,
        TextInputType,
        Widget;
import 'package:flutter_guiritter/common/common.import.dart'
    as common_gui_ritter show AppLocalizationsGuiRitter;
import 'package:flutter_guiritter/model/model.import.dart'
    show L10nModel, StateModel;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

class TextFormFieldL10n<AppLocalizationsLocalType,
        StateModelLocalType extends StateModel<AppLocalizationsLocalType>>
    extends StatelessWidget {
  final String autofillHint;
  final TextEditingController? controller;

  final String Function(
    common_gui_ritter.AppLocalizationsGuiRitter?,
  )? invalidMessageL10nGuiRitter;

  final String Function(
    AppLocalizationsLocalType?,
  )? invalidMessageL10n;

  final TextInputType keyboardType;

  final String Function(
    common_gui_ritter.AppLocalizationsGuiRitter?,
  )? labelL10nGuiRitter;

  final String Function(
    AppLocalizationsLocalType?,
  )? labelL10n;

  final bool? obscureText;

  const TextFormFieldL10n({
    super.key,
    required this.autofillHint,
    required this.controller,
    this.invalidMessageL10nGuiRitter,
    this.invalidMessageL10n,
    required this.keyboardType,
    this.labelL10nGuiRitter,
    this.labelL10n,
    this.obscureText,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      StoreConnector<StateModelLocalType,
          L10nModel<AppLocalizationsLocalType, StateModelLocalType>>(
        distinct: true,
        converter:
            L10nModel.select<AppLocalizationsLocalType, StateModelLocalType>,
        builder: connectorBuilder,
      );

  Widget connectorBuilder(
    BuildContext context,
    L10nModel l10nModel,
  ) {
    return TextFormField(
      autofillHints: [
        autofillHint,
      ],
      controller: controller,
      decoration: InputDecoration(
        labelText: getLabel(
          l10nModel,
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      validator: (
        value,
      ) =>
          (value?.isEmpty ?? true)
              ? getInvalidMessage(
                  l10nModel,
                )
              : null,
    );
  }

  String getInvalidMessage(
    L10nModel l10nModel,
  ) =>
      (invalidMessageL10nGuiRitter != null)
          ? invalidMessageL10nGuiRitter!(l10nModel.l10nGuiRitter!)
          : (invalidMessageL10n != null)
              ? invalidMessageL10n!(l10nModel.l10n!)
              : "";

  String getLabel(
    L10nModel l10nModel,
  ) =>
      (labelL10nGuiRitter != null)
          ? labelL10nGuiRitter!(l10nModel.l10nGuiRitter!)
          : (labelL10n != null)
              ? labelL10n!(l10nModel.l10n!)
              : "";
}
