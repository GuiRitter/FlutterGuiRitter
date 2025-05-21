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
  final SvgPicture background;
  final SvgPicture logo;

  const SplashPage({
    super.key,
    required this.background,
    required this.logo,
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
            background,
            Center(
              child: SizedBox(
                width: smallestSizeHalf,
                height: smallestSizeHalf,
                child: logo,
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
