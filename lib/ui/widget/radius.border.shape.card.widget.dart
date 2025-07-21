import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Card,
        ConnectionState,
        FutureBuilder,
        GlobalKey,
        ListTile,
        Material,
        Offstage,
        Padding,
        RoundedRectangleBorder,
        Semantics,
        SingleChildRenderObjectElement,
        SizedBox,
        StatelessElement,
        StatelessWidget,
        Text,
        Widget;
import 'package:flutter_guiritter/common/_import.dart' show appName;
import 'package:flutter_guiritter/extension/_import.dart'
    show BorderRadiusExtension;
import 'package:flutter_guiritter/redux/theme/action.dart'
    show setCardBorderShapeRadius;
import 'package:flutter_guiritter/util/_import.dart' show logger;

double? cardBorderShapeRadius;

final GlobalKey cardKey = GlobalKey();

final _log = logger('CardBorderShapeRadiusWidget');

Future<double> getCardBorderShapeRadius({
  required int delay,
}) async {
  _log('getCardBorderShapeRadius')
      .raw('delay', delay)
      .raw('cardBorderShapeRadius', cardBorderShapeRadius)
      .print();

  if (cardBorderShapeRadius != null) {
    return cardBorderShapeRadius!;
  }

  await Future.delayed(
    Duration(
      microseconds: delay,
    ),
  );

  final BuildContext? context = cardKey.currentContext;

  if (context != null) {
    final statelessElement = context as StatelessElement;

    SingleChildRenderObjectElement? singleChildRenderObjectElement;

    statelessElement.visitChildElements(
      (
        element,
      ) {
        singleChildRenderObjectElement =
            element as SingleChildRenderObjectElement;
      },
    );

    final semantics = singleChildRenderObjectElement!.widget as Semantics;

    final padding = semantics.child as Padding;

    final material = padding.child as Material;

    final border = material.shape as RoundedRectangleBorder;

    final radius = border.borderRadius as BorderRadius;

    final newCardBorderShapeRadius = radius.max;

    cardBorderShapeRadius = newCardBorderShapeRadius;

    setCardBorderShapeRadius(
      cardBorderShapeRadius: newCardBorderShapeRadius,
    );

    return newCardBorderShapeRadius;
  } else {
    return await getCardBorderShapeRadius(
      delay: delay + 1,
    );
  }
}

class CardBorderShapeRadiusWidget extends StatelessWidget {
  const CardBorderShapeRadiusWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return FutureBuilder(
      future: getCardBorderShapeRadius(
        delay: 0,
      ),
      builder: (
        context,
        snapshot,
      ) =>
          (snapshot.hasData &&
                  (snapshot.connectionState == ConnectionState.done))
              ? const Offstage(
                  offstage: true,
                  child: SizedBox.shrink(),
                )
              : Card.filled(
                  key: cardKey,
                  child: const ListTile(
                    title: Text(
                      appName,
                    ),
                  ),
                ),
    );
  }
}
