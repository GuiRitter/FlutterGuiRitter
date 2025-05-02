import 'package:flutter/material.dart' show SnackBar, Text;
import 'package:flutter_guiritter/common/common.import.dart' show snackState;
import 'package:flutter_guiritter/util/util.import.dart' show logger;

final _log = logger('snack_bar');

void showSnackBar({
  required String? message,
}) {
  _log('showSnackBar').raw('message', message).print();

  snackState.currentState!.showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(
        message ?? '',
      ),
    ),
  );
}
