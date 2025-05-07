import 'package:flutter_guiritter/model/model.import.dart' show StateModel;
import 'package:flutter_guiritter/ui/widget/widget.import.dart'
    show AppBarCustomWidget;

class AppBarSignedOutWidget<AppLocalizationsLocalType,
        StateModelLocalType extends StateModel<AppLocalizationsLocalType>>
    extends AppBarCustomWidget<AppLocalizationsLocalType, StateModelLocalType> {
  AppBarSignedOutWidget({
    super.key,
    super.appBarLeading,
    required super.title,
    super.subtitle,
  });
}
