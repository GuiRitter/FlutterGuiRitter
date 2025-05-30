import 'package:flutter/material.dart' show BuildContext, Icons, PopupMenuItem;
import 'package:flutter_guiritter/common/_import.dart'
    show AppBarPopupMenuEnum, l10nGuiRitter;
import 'package:flutter_guiritter/redux/_import.dart' show dispatch;
import 'package:flutter_guiritter/redux/user/action.dart' as user_action;
import 'package:flutter_guiritter/ui/widget/_import.dart'
    show AppBarCustomWidget;
import 'package:flutter_guiritter/util/_import.dart' show buildPopupMenuItem;

Map<
    String,
    dynamic Function(
      BuildContext,
    )> buildOnHomePopupMenuItemPressedMap(
    Map<
            String,
            dynamic Function(
              BuildContext,
            )>?
        onHomePopupMenuItemPressedMap) {
  final signedInMap = {
    AppBarPopupMenuEnum.signOut.name: (
      context,
    ) {
      dispatch(
        user_action.signOut(),
      );
    }
  };

  return (onHomePopupMenuItemPressedMap != null)
      ? {
          ...onHomePopupMenuItemPressedMap,
          ...signedInMap,
        }
      : signedInMap;
}

List<PopupMenuItem<String>> Function({
  required List<PopupMenuItem<String>> popupMenuItemList,
}) buildPopupMenuItemBuilder(
        List<PopupMenuItem<String>> Function({
          required List<PopupMenuItem<String>> popupMenuItemList,
        })? popupMenuItemBuilder) =>
    ({
      required List<PopupMenuItem<String>> popupMenuItemList,
    }) {
      final signedInList = [
        ...popupMenuItemList,
        buildPopupMenuItem(
          value: AppBarPopupMenuEnum.signOut,
          icon: Icons.logout,
          titleString: l10nGuiRitter!.signOut,
        ),
      ];

      return (popupMenuItemBuilder != null)
          ? popupMenuItemBuilder(
              popupMenuItemList: signedInList,
            )
          : signedInList;
    };

class AppBarSignedInWidget<AppLocalizationsLocalType>
    extends AppBarCustomWidget<AppLocalizationsLocalType> {
  AppBarSignedInWidget({
    super.key,
    super.appBarLeading,
    required super.title,
    super.subtitle,
    Map<
            String,
            dynamic Function(
              BuildContext,
            )>?
        onHomePopupMenuItemPressedMap,
    List<PopupMenuItem<String>> Function({
      required List<PopupMenuItem<String>> popupMenuItemList,
    })? popupMenuItemBuilder,
  }) : super(
          onHomePopupMenuItemPressedMap: buildOnHomePopupMenuItemPressedMap(
            onHomePopupMenuItemPressedMap,
          ),
          popupMenuItemBuilder: buildPopupMenuItemBuilder(
            popupMenuItemBuilder,
          ),
        );
}
