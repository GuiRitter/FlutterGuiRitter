import 'package:flutter/material.dart' show BuildContext, Navigator;
import 'package:flutter_guiritter/util/util.import.dart' show logger;

final _log = logger('util/dialog');

onDialogCancelPressed({
  required BuildContext context,
}) {
  _log('onDialogCancelPressed').print();

  Navigator.pop(
    context,
  );
}
