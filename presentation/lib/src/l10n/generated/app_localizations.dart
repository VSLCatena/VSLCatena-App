import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_nl.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('nl')
  ];

  /// The name of our beautiful app
  ///
  /// In en, this message translates to:
  /// **'V.S.L. Catena'**
  String get appTitle;

  /// The login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get onboardingLogin;

  /// The title of the home screen
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get titleHome;

  /// The title of the announcements screen
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get titleAnnouncements;

  /// The title of the members screen
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get titleMembers;

  /// The title of the promotion screen
  ///
  /// In en, this message translates to:
  /// **'Promo'**
  String get titlePromo;

  /// The title of the profile screen
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get titleProfile;

  /// The title of the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get titleSettings;

  /// The title of the about screen
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get titleAbout;

  /// The members tab on the members screen
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get memberTabMembers;

  /// The committees tab on the members screen
  ///
  /// In en, this message translates to:
  /// **'Committees'**
  String get memberTabCommittees;

  /// The home button in the bottomBar
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomBarHome;

  /// The news button in the bottomBar
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get bottomBarNews;

  /// The promo button in the bottomBar
  ///
  /// In en, this message translates to:
  /// **'Promo'**
  String get bottomBarPromo;

  /// The members button in the bottomBar
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get bottomBarMembers;

  /// The settings button in the drawer
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get drawerSettings;

  /// The about button in the drawer
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get drawerAbout;

  /// The logout button in the drawer
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get drawerLogout;

  /// The separator between date and time
  ///
  /// In en, this message translates to:
  /// **'at'**
  String get dateTimeSeparator;

  /// The text before the author of a post
  ///
  /// In en, this message translates to:
  /// **'By'**
  String get writtenBy;

  /// Monday
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get dayMonday;

  /// Tuesday
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get dayTuesday;

  /// Wednesday
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get dayWednesday;

  /// Thursday
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get dayThursday;

  /// Friday
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get dayFriday;

  /// Saturday
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get daySaturday;

  /// Sunday
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get daySunday;

  /// January
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthJanuary;

  /// February
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthFebruary;

  /// March
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthMarch;

  /// April
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthApril;

  /// May
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// June
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthJune;

  /// July
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthJuly;

  /// August
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthAugust;

  /// September
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthSeptember;

  /// October
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthOctober;

  /// November
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthNovember;

  /// December
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthDecember;

  /// The dark theme button in the settings screen
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get settingsButtonDarkTheme;

  /// The use Material You button in the settings screen
  ///
  /// In en, this message translates to:
  /// **'Use Material You'**
  String get settingsButtonUseMaterialYou;

  /// The divider between text
  ///
  /// In en, this message translates to:
  /// **'  •  '**
  String get textSeparator;

  /// The title of the committees section in the profile screen
  ///
  /// In en, this message translates to:
  /// **'Committees:'**
  String get profileCommitteeTitle;

  /// No description provided for @committeeProfileMembersTitle.
  ///
  /// In en, this message translates to:
  /// **'Members:'**
  String get committeeProfileMembersTitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'nl':
      return AppLocalizationsNl();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
