import 'package:flutter/material.dart'
    show
        BoxFit,
        BuildContext,
        Center,
        CircularProgressIndicator,
        Color,
        MediaQuery,
        Scaffold,
        SizedBox,
        Stack,
        StatelessWidget,
        Widget;
import 'package:flutter_guiritter/common/_import.dart' show MIMEType;
import 'package:flutter_guiritter/ui/widget/_import.dart'
    show CardBorderShapeRadiusWidget;
import 'package:flutter_guiritter/util/_import.dart' show getAssetByMIMEType;

class SplashPage extends StatelessWidget {
  final String backgroundAssetName;
  final String backgroundSemanticsLabel;
  final MIMEType backgroundMimeType;
  final String logoAssetName;
  final String logoSemanticsLabel;
  final MIMEType logoMimeType;
  final Color? circularProgressIndicatorColor;

  const SplashPage({
    super.key,
    required this.backgroundAssetName,
    required this.backgroundSemanticsLabel,
    required this.backgroundMimeType,
    required this.logoAssetName,
    required this.logoSemanticsLabel,
    required this.logoMimeType,
    this.circularProgressIndicatorColor,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final mediaSize = MediaQuery.of(
      context,
    ).size;

    final smallestSize = mediaSize.shortestSide;

    final smallestSizeHalf = smallestSize / 2;

    return Scaffold(
      body: SizedBox(
        height: mediaSize.height,
        width: mediaSize.width,
        child: Stack(
          // fit: StackFit.passthrough,
          children: [
            getAssetByMIMEType(
              mimeType: backgroundMimeType,
              name: backgroundAssetName,
              semanticsLabel: backgroundSemanticsLabel,
              fit: BoxFit.fill,
              mediaSize: mediaSize,
            ),
            Center(
              child: SizedBox(
                width: smallestSizeHalf,
                height: smallestSizeHalf,
                child: getAssetByMIMEType(
                  mimeType: logoMimeType,
                  name: logoAssetName,
                  semanticsLabel: logoSemanticsLabel,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: smallestSizeHalf,
                height: smallestSizeHalf,
                child: CircularProgressIndicator(
                  color: circularProgressIndicatorColor,
                ),
              ),
            ),
            const CardBorderShapeRadiusWidget(),
          ],
        ),
      ),
    );
  }
}
