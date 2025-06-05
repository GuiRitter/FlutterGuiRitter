import 'package:flutter/material.dart'
    show Alignment, ButtonStyle, MainAxisAlignment, Row, TextButton, Widget;

Widget buildRowForMultiChoice({
  required Widget child,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        child,
      ],
    );

Widget buildTextButton({
  required Widget label,
  required void Function() onPressed,
  bool align = false,
}) =>
    TextButton(
      style: align
          ? const ButtonStyle(
              alignment: Alignment.centerRight,
            )
          : null,
      onPressed: onPressed,
      child: label,
    );
