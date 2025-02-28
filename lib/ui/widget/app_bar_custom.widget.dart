import 'package:flutter/material.dart'
    show
        AnnotatedRegion,
        AppBar,
        BuildContext,
        GlobalKey,
        Icon,
        Icons,
        ListTile,
        Material,
        PopupMenuButton,
        PopupMenuItem,
        PreferredSizeWidget,
        Semantics,
        SingleChildRenderObjectElement,
        StatefulElement,
        StatelessWidget,
        Text,
        Widget,
        kToolbarHeight;
import 'package:flutter/services.dart' show Size, SystemUiOverlayStyle;
import 'package:flutter_guiritter/common/settings.dart' show l10nGuiRitter;
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

class AppBarCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

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
      title: Text(
        title,
      ),
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
              _log('Hello').print(),
        ),
      ],
    );
  }
}
