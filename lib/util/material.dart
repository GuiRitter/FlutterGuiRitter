import 'package:flutter/material.dart'
    show BoxFit, Image, IntrinsicColumnWidth, Size, Widget;
import 'package:flutter_guiritter/common/_import.dart' show MIMEType;
import 'package:flutter_svg/svg.dart' show SvgPicture;

buildIntrinsicColumnWidthMap({
  required int count,
}) =>
    {
      for (final index in Iterable<int>.generate(
        count,
      ))
        index: const IntrinsicColumnWidth(),
    };

Widget getAssetByMIMEType({
  required dynamic mimeType,
  required String name,
  required dynamic semanticsLabel,
  BoxFit? fit,
  Size? mediaSize,
}) =>
    (mimeType == MIMEType.imageSvgXml)
        ? ((fit != null)
            ? SvgPicture.asset(
                name,
                semanticsLabel: semanticsLabel,
                fit: fit,
                height: mediaSize?.height,
                width: mediaSize?.width,
              )
            : SvgPicture.asset(
                name,
                semanticsLabel: semanticsLabel,
                height: mediaSize?.height,
                width: mediaSize?.width,
              ))
        : Image.asset(
            name,
            semanticLabel: semanticsLabel,
            fit: fit,
            height: mediaSize?.height,
            width: mediaSize?.width,
          );
