import 'dart:ui' show Color;

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
import 'package:flutter_guiritter/redux/theme/action.dart' as theme_action
    show setCardBorderShapeRadius, setCardColor;
import 'package:flutter_guiritter/util/_import.dart' show logger;

double? cardBorderShapeRadius;

Color? cardColor;

final GlobalKey cardKey = GlobalKey();

final _log = logger('CardMaterialDefaultWidget');

Future<void> getMaterialDefault({
  required int delay,
}) async {
  _log('getMaterialDefault')
      .raw('delay', delay)
      .raw('cardBorderShapeRadius', cardBorderShapeRadius)
      .exists('cardColor', cardColor)
      .print();

  if ((cardBorderShapeRadius != null) && (cardColor != null)) {
    return;
  }

  await Future.delayed(
    Duration(
      microseconds: delay,
    ),
  );

  final BuildContext? context = cardKey.currentContext;

  _log('getMaterialDefault').exists('context', cardKey.currentContext).print();

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

    _log('getMaterialDefault')
        .asString('material.color', material.color)
        .print();

    if (material.color != null) {
      cardColor = material.color;

      theme_action.setCardColor(
        cardColor: cardColor!,
      );
    }

    final border = material.shape as RoundedRectangleBorder;

    final radius = border.borderRadius as BorderRadius;

    final newCardBorderShapeRadius = radius.max;

    cardBorderShapeRadius = newCardBorderShapeRadius;

    _log('getMaterialDefault')
        .exists('cardBorderShapeRadius', newCardBorderShapeRadius)
        .print();

    theme_action.setCardBorderShapeRadius(
      cardBorderShapeRadius: newCardBorderShapeRadius,
    );

    return;
  } else {
    return await getMaterialDefault(
      delay: delay + 1,
    );
  }
}

class CardMaterialDefaultWidget extends StatelessWidget {
  const CardMaterialDefaultWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return FutureBuilder(
      future: getMaterialDefault(
        delay: 0,
      ),
      builder: (
        context,
        snapshot,
      ) {
        _log('build')
            .raw('snapshot.hasData', snapshot.hasData)
            .enum_('snapshot.connectionState', snapshot.connectionState)
            .raw('cardBorderShapeRadius', cardBorderShapeRadius)
            .exists('cardColor', cardColor)
            .print();

        return (snapshot.hasData &&
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
              );
      },
    );
  }
}
