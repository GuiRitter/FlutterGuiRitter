import 'package:flutter/material.dart'
    show
        AutofillGroup,
        BuildContext,
        Column,
        EdgeInsets,
        ElevatedButton,
        Form,
        FormState,
        GlobalKey,
        Padding,
        SingleChildScrollView,
        StatelessWidget,
        TextEditingController,
        Theme,
        Widget;
import 'package:flutter/services.dart'
    show AutofillHints, TextInput, TextInputType;
import 'package:flutter_guiritter/model/_import.dart'
    show SignInModel, SignInRequestModel;
import 'package:flutter_guiritter/redux/_import.dart' show dispatch;
import 'package:flutter_guiritter/redux/user/action.dart' as user_action;
import 'package:flutter_guiritter/ui/widget/_import.dart'
    show AppBarSignedOutWidget, TextFormFieldL10n, TextL10n;
import 'package:flutter_guiritter/ui/widget/_import.dart' show BodyWidget;
import 'package:flutter_guiritter/util/_import.dart' show logger;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

final _log = logger('SignInPage');

class SignInPage<AppLocalizationsLocalType> extends StatelessWidget {
  final Widget title;

  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignInPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      StoreConnector<Map<String, dynamic>,
          SignInModel<AppLocalizationsLocalType>>(
        distinct: true,
        converter: SignInModel.select,
        builder: connectorBuilder,
      );

  Widget connectorBuilder(
    BuildContext context,
    SignInModel<AppLocalizationsLocalType> signInModel,
  ) {
    _log('connectorBuilder').map('signInModel', signInModel).print();

    onSignInPressed() => signIn(
          context: context,
        );

    return BodyWidget(
      appBar: AppBarSignedOutWidget<AppLocalizationsLocalType>(title: title),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          Theme.of(
                context,
              ).textTheme.titleLarge?.fontSize ??
              0,
        ),
        child: Form(
          key: formKey,
          child: AutofillGroup(
            child: Column(
              children: [
                TextFormFieldL10n<AppLocalizationsLocalType>(
                  autofillHint: AutofillHints.username,
                  controller: userIdController,
                  invalidMessageL10nGuiRitter: (l) => l!.invalidUserID,
                  keyboardType: TextInputType.text,
                  labelL10nGuiRitter: (l) => l!.userID,
                ),
                TextFormFieldL10n<AppLocalizationsLocalType>(
                  autofillHint: AutofillHints.password,
                  controller: passwordController,
                  invalidMessageL10nGuiRitter: (l) => l!.invalidPassword,
                  keyboardType: TextInputType.visiblePassword,
                  labelL10nGuiRitter: (l) => l!.password,
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: Theme.of(
                          context,
                        ).textTheme.titleLarge?.fontSize ??
                        0,
                  ),
                  child: ElevatedButton(
                    onPressed: onSignInPressed,
                    child: TextL10n(
                      l10nGuiRitterSelector: (l) => l!.signIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signIn({
    required BuildContext context,
  }) async {
    _log('onSingInPressed').print();

    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    TextInput.finishAutofillContext();

    formKey.currentState?.save();

    dispatch(
      user_action.signIn(
        signInModel: SignInRequestModel(
          userId: userIdController.text,
          password: passwordController.text,
        ),
      ),
    );
  }
}
