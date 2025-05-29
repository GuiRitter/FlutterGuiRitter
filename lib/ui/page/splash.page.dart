import 'dart:math';

import 'package:flutter/material.dart'
    show
        BoxFit,
        BuildContext,
        Center,
        CircularProgressIndicator,
        MediaQuery,
        Scaffold,
        SizedBox,
        Stack,
        StatelessWidget,
        Widget;
import 'package:flutter_svg/svg.dart' show SvgPicture;

class SplashPage extends StatelessWidget {
  final String backgroundAssetName;
  final String backgroundSemanticsLabel;
  final String logoAssetName;
  final String logoSemanticsLabel;

  const SplashPage({
    super.key,
    required this.backgroundAssetName,
    required this.backgroundSemanticsLabel,
    required this.logoAssetName,
    required this.logoSemanticsLabel,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final mediaSize = MediaQuery.of(
      context,
    ).size;

    final smallestSize = min(
      mediaSize.height,
      mediaSize.width,
    );

    final smallestSizeHalf = smallestSize / 2;

    return Scaffold(
      body: SizedBox(
        height: mediaSize.height,
        width: mediaSize.width,
        child: Stack(
          // fit: StackFit.passthrough,
          children: [
            SvgPicture.asset(
              backgroundAssetName,
              semanticsLabel: backgroundSemanticsLabel,
              fit: BoxFit.fill,
              height: mediaSize.height,
              width: mediaSize.width,
            ),
            Center(
              child: SizedBox(
                width: smallestSizeHalf,
                height: smallestSizeHalf,
                child: SvgPicture.asset(
                  logoAssetName,
                  semanticsLabel: logoSemanticsLabel,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: smallestSizeHalf,
                height: smallestSizeHalf,
                child: const CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
