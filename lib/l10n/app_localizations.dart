import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizationsGuiRitter
/// returned by `AppLocalizationsGuiRitter.of(context)`.
///
/// Applications need to include `AppLocalizationsGuiRitter.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizationsGuiRitter.localizationsDelegates,
///   supportedLocales: AppLocalizationsGuiRitter.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizationsGuiRitter.supportedLocales
/// property.
abstract class AppLocalizationsGuiRitter {
  AppLocalizationsGuiRitter(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizationsGuiRitter? of(BuildContext context) {
    return Localizations.of<AppLocalizationsGuiRitter>(context, AppLocalizationsGuiRitter);
  }

  static const LocalizationsDelegate<AppLocalizationsGuiRitter> delegate = _AppLocalizationsGuiRitterDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @appTheme.
  ///
  /// In en, this message translates to:
  /// **'🎨 App theme'**
  String get appTheme;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @chooseTheme.
  ///
  /// In en, this message translates to:
  /// **'Choose the app\'\'s theme:'**
  String get chooseTheme;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'🌙 Dark'**
  String get darkTheme;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Invalid password.'**
  String get invalidPassword;

  /// No description provided for @invalidUserID.
  ///
  /// In en, this message translates to:
  /// **'Invalid user ID.'**
  String get invalidUserID;

  /// No description provided for @keep.
  ///
  /// In en, this message translates to:
  /// **'Keep'**
  String get keep;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'☀ Light'**
  String get lightTheme;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @loadingTag_signIn.
  ///
  /// In en, this message translates to:
  /// **'Signing in'**
  String get loadingTag_signIn;

  /// No description provided for @loadingTag_validateAndSetToken.
  ///
  /// In en, this message translates to:
  /// **'Checking saved credential'**
  String get loadingTag_validateAndSetToken;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @reload.
  ///
  /// In en, this message translates to:
  /// **'🔄 Reload data'**
  String get reload;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'⛔ Sign out'**
  String get signOut;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'⚙ System'**
  String get systemTheme;

  /// No description provided for @testDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'🤡 🌙 Teste'**
  String get testDarkTheme;

  /// No description provided for @testLightTheme.
  ///
  /// In en, this message translates to:
  /// **'🤡 ☀ Teste'**
  String get testLightTheme;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error'**
  String get unexpectedError;

  /// No description provided for @userID.
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userID;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get userName;

  /// No description provided for @userNameInvalid.
  ///
  /// In en, this message translates to:
  /// **'User name must be filled'**
  String get userNameInvalid;
}

class _AppLocalizationsGuiRitterDelegate extends LocalizationsDelegate<AppLocalizationsGuiRitter> {
  const _AppLocalizationsGuiRitterDelegate();

  @override
  Future<AppLocalizationsGuiRitter> load(Locale locale) {
    return SynchronousFuture<AppLocalizationsGuiRitter>(lookupAppLocalizationsGuiRitter(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsGuiRitterDelegate old) => false;
}

AppLocalizationsGuiRitter lookupAppLocalizationsGuiRitter(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsGuiRitterEn();
    case 'pt': return AppLocalizationsGuiRitterPt();
  }

  throw FlutterError(
    'AppLocalizationsGuiRitter.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
