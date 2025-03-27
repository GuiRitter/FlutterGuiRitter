import 'package:flutter/material.dart'
    show
        BuildContext,
        kToolbarHeight,
        PreferredSizeWidget,
        Size,
        StatelessWidget,
        Widget;
import 'package:flutter_guiritter/model/model.import.dart' show StateModel;
import 'package:flutter_guiritter/ui/widget/widget.import.dart'
    show AppBarCustomWidget;

class AppBarSignedOutWidget<AppLocalizationsLocalType,
        StateModelLocalType extends StateModel<AppLocalizationsLocalType>>
    extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const AppBarSignedOutWidget({
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
      );
}
