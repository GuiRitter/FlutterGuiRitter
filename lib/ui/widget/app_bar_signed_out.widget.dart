import 'package:flutter_guiritter/ui/widget/_import.dart'
    show AppBarCustomWidget;

class AppBarSignedOutWidget<AppLocalizationsLocalType>
    extends AppBarCustomWidget<AppLocalizationsLocalType> {
  AppBarSignedOutWidget({
    super.key,
    super.appBarLeading,
    required super.title,
    super.subtitle,
  });
}
