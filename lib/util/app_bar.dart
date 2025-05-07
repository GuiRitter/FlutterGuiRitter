import 'package:flutter/material.dart'
    show Icon, IconData, ListTile, PopupMenuItem, Text, Widget;

PopupMenuItem<String> buildPopupMenuItem({
  required Enum value,
  required IconData icon,
  String? titleString,
  Widget? titleWidget,
}) {
  titleString ??= '';

  titleWidget ??= Text(
    titleString,
  );

  return PopupMenuItem<String>(
    value: value.name,
    child: ListTile(
      leading: Icon(
        icon,
      ),
      title: titleWidget,
    ),
  );
}
