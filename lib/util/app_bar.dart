import 'package:flutter/material.dart'
    show Icon, IconData, ListTile, PopupMenuItem, Text;

PopupMenuItem<String> buildPopupMenuItem({
  required Enum value,
  required IconData icon,
  required String title,
}) =>
    PopupMenuItem<String>(
      value: value.name,
      child: ListTile(
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
        ),
      ),
    );
