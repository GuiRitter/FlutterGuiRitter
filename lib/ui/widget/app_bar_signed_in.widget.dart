import 'package:flutter/material.dart'
    show
        BuildContext,
        Icons,
        PopupMenuItem,
        PreferredSizeWidget,
        Size,
        StatelessWidget,
        Widget,
        kToolbarHeight;
import 'package:flutter_guiritter/common/common.import.dart'
    show AppBarPopupMenuEnum, l10nGuiRitter;
import 'package:flutter_guiritter/model/model.import.dart' show StateModel;
import 'package:flutter_guiritter/redux/redux.import.dart' show dispatch;
import 'package:flutter_guiritter/redux/user/action.dart' as user_action;
import 'package:flutter_guiritter/ui/widget/widget.import.dart'
    show AppBarCustomWidget;
import 'package:flutter_guiritter/util/util.import.dart'
    show buildPopupMenuItem;

class AppBarSignedInWidget<AppLocalizationsLocalType,
        StateModelLocalType extends StateModel<AppLocalizationsLocalType>>
    extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const AppBarSignedInWidget({
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
  ) =>
      AppBarCustomWidget<AppLocalizationsLocalType, StateModelLocalType>(
        title: title,
        popupMenuItemBuilder: ({
          required List<PopupMenuItem<String>> popupMenuItemList,
        }) =>
            [
          ...popupMenuItemList,
          buildPopupMenuItem(
            value: AppBarPopupMenuEnum.signOut,
            icon: Icons.logout,
            title: l10nGuiRitter!.signOut,
          ),
        ],
        onHomePopupMenuItemPressedMap: {
          AppBarPopupMenuEnum.signOut.name: (
            context,
          ) {
            dispatch(
              user_action.signOut(),
            );
          }
        },
      );
}
