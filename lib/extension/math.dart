import 'dart:math' as math;

import 'package:flutter/painting.dart' show BorderRadius, Radius;

extension BorderRadiusExtension on BorderRadius {
  double get max => math.max(
        math.max(
          bottomLeft.max,
          bottomRight.max,
        ),
        math.max(
          topLeft.max,
          topRight.max,
        ),
      );
}

extension RadiusExtension on Radius {
  double get max => math.max(
        x,
        y,
      );
}
