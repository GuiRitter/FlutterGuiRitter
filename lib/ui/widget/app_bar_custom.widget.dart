import 'package:flutter/material.dart'
    show
        AlertDialog,
        AnnotatedRegion,
        AppBar,
        BuildContext,
        Column,
        GlobalKey,
        Icons,
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
import 'package:flutter_guiritter/common/common.import.dart'
    show AppBarPopupMenuEnum, l10nGuiRitter;
import 'package:flutter_guiritter/model/model.import.dart' show StateModel;
import 'package:flutter_guiritter/ui/widget/widget.import.dart'
    show ThemeOptionWidget;
import 'package:flutter_guiritter/util/util.import.dart'
    show buildPopupMenuItem, logger;

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
  final List<PopupMenuItem<String>> popupMenuItemList =
      <PopupMenuItem<String>>[];

  final Map<
      String,
      dynamic Function(
        BuildContext,
      )> onHomePopupMenuItemPressedMap = <String,
      dynamic Function(
    BuildContext,
  )>{};

  final Widget title;

  AppBarCustomWidget({
    super.key,
    required this.title,
    Map<
            String,
            dynamic Function(
              BuildContext,
            )>?
        onHomePopupMenuItemPressedMap,
    List<PopupMenuItem<String>> Function({
      required List<PopupMenuItem<String>> popupMenuItemList,
    })? popupMenuItemBuilder,
  }) {
    {
      var popupMenuItemTempList = <PopupMenuItem<String>>[
        buildPopupMenuItem(
          value: AppBarPopupMenuEnum.theme,
          icon: Icons.color_lens,
          titleString: l10nGuiRitter!.appTheme,
        ),
      ];

      if (popupMenuItemBuilder != null) {
        popupMenuItemTempList = popupMenuItemBuilder(
          popupMenuItemList: popupMenuItemTempList,
        );
      }

      popupMenuItemList.addAll(
        popupMenuItemTempList,
      );
    }

    this.onHomePopupMenuItemPressedMap[AppBarPopupMenuEnum.theme.name] = (
      BuildContext context,
    ) =>
        showDialog(
          context: context,
          builder: (
            context,
          ) {
            final optionList = [
              ThemeOptionWidget<AppLocalizationsLocalType, StateModelLocalType>(
                themeMode: ThemeMode.dark,
                title: l10nGuiRitter!.darkTheme,
              ),
              ThemeOptionWidget<AppLocalizationsLocalType, StateModelLocalType>(
                themeMode: ThemeMode.light,
                title: l10nGuiRitter!.lightTheme,
              ),
              ThemeOptionWidget<AppLocalizationsLocalType, StateModelLocalType>(
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
        );

    if (onHomePopupMenuItemPressedMap != null) {
      this.onHomePopupMenuItemPressedMap.addAll(
            onHomePopupMenuItemPressedMap,
          );
    }
  }

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
              popupMenuItemList,
          onSelected: (
            value,
          ) =>
              this.onHomePopupMenuItemPressedMap[value]!(
            context,
          ),
        ),
      ],
    );
  }
}
