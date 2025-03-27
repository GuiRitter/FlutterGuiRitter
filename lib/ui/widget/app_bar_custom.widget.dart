import 'package:flutter/material.dart'
    show
        AlertDialog,
        AnnotatedRegion,
        AppBar,
        BuildContext,
        Column,
        GlobalKey,
        Icon,
        Icons,
        ListTile,
        MainAxisSize,
        Material,
        PopupMenuButton,
        PopupMenuItem,
        PreferredSizeWidget,
        Semantics,
        SingleChildRenderObjectElement,
        StatefulElement,
        StatelessWidget,
        Text,
        ThemeMode,
        Widget,
        kToolbarHeight,
        showDialog;
import 'package:flutter/services.dart' show Size, SystemUiOverlayStyle;
import 'package:flutter_guiritter/common/settings.dart' show l10nGuiRitter;
import 'package:flutter_guiritter/model/model.import.dart' show StateModel;
import 'package:flutter_guiritter/ui/widget/widget.import.dart';
import 'package:flutter_guiritter/util/util.import.dart' show logger;

double? appBarElevation;

final GlobalKey appBarKey = GlobalKey();

final _log = logger('appBarCustom');

Future<double> getAppBarElevation({
  required int delay,
}) async {
  _log('getAppBarElevation').raw('delay', delay).print();

  if (appBarElevation != null) {
    return appBarElevation!;
  }

  await Future.delayed(
    Duration(
      microseconds: delay,
    ),
  );

  final BuildContext? context = appBarKey.currentContext;

  if (context != null) {
    final statefulElement = context as StatefulElement;

    SingleChildRenderObjectElement? singleChildRenderObjectElement;

    statefulElement.visitChildElements(
      (
        element,
      ) {
        singleChildRenderObjectElement =
            element as SingleChildRenderObjectElement;
      },
    );

    final semantics = singleChildRenderObjectElement!.widget as Semantics;

    final annotatedRegion = semantics.child as AnnotatedRegion;

    final material = annotatedRegion.child as Material;

    appBarElevation = material.elevation;

    return appBarElevation!;
  } else {
    return await getAppBarElevation(
      delay: delay + 1,
    );
  }
}

class AppBarCustomWidget<AppLocalizationsLocalType,
        StateModelLocalType extends StateModel<AppLocalizationsLocalType>>
    extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const AppBarCustomWidget({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(
        kToolbarHeight,
      );

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      key: appBarKey,
      title: title,
      actions: [
        PopupMenuButton<String>(
          itemBuilder: (
            context,
          ) =>
              [
            PopupMenuItem<String>(
              value: 'theme',
              child: ListTile(
                leading: const Icon(
                  Icons.color_lens,
                ),
                title: Text(
                  l10nGuiRitter!.appTheme,
                ),
              ),
            )
          ],
          onSelected: (
            value,
          ) =>
              showDialog(
            context: context,
            builder: (
              context,
            ) {
              final optionList = [
                ThemeOptionWidget<AppLocalizationsLocalType,
                    StateModelLocalType>(
                  themeMode: ThemeMode.dark,
                  title: l10nGuiRitter!.darkTheme,
                ),
                ThemeOptionWidget<AppLocalizationsLocalType,
                    StateModelLocalType>(
                  themeMode: ThemeMode.light,
                  title: l10nGuiRitter!.lightTheme,
                ),
                ThemeOptionWidget<AppLocalizationsLocalType,
                    StateModelLocalType>(
                  themeMode: ThemeMode.system,
                  title: l10nGuiRitter!.systemTheme,
                ),
              ];

              return AlertDialog(
                title: Text(
                  l10nGuiRitter!.chooseTheme,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: optionList,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
