import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.g.dart';
import 'l10n_ja.g.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
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
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

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
    Locale('ja')
  ];

  /// No description provided for @generalAppTitle.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get generalAppTitle;

  /// No description provided for @generalOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get generalOk;

  /// No description provided for @generalNg.
  ///
  /// In en, this message translates to:
  /// **'NG'**
  String get generalNg;

  /// No description provided for @generalYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get generalYes;

  /// No description provided for @generalNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get generalNo;

  /// No description provided for @generalClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get generalClose;

  /// No description provided for @generalAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get generalAdd;

  /// No description provided for @generalCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get generalCreate;

  /// No description provided for @generalEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get generalEdit;

  /// No description provided for @generalUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get generalUpdate;

  /// No description provided for @generalSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get generalSearch;

  /// No description provided for @generalBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get generalBack;

  /// No description provided for @generalShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get generalShare;

  /// No description provided for @generalNoDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available.'**
  String get generalNoDataAvailable;

  /// No description provided for @appExceptionMessage.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred.'**
  String get appExceptionMessage;

  /// No description provided for @appHttpExceptionBadRequestMessage.
  ///
  /// In en, this message translates to:
  /// **'Bad Request'**
  String get appHttpExceptionBadRequestMessage;

  /// No description provided for @appHttpExceptionUnauthorizedMessage.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get appHttpExceptionUnauthorizedMessage;

  /// No description provided for @appHttpExceptionPaymentRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Payment Required'**
  String get appHttpExceptionPaymentRequiredMessage;

  /// No description provided for @appHttpExceptionForbiddenMessage.
  ///
  /// In en, this message translates to:
  /// **'Forbidden'**
  String get appHttpExceptionForbiddenMessage;

  /// No description provided for @appHttpExceptionNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get appHttpExceptionNotFoundMessage;

  /// No description provided for @appHttpExceptionMethodNotAllowedMessage.
  ///
  /// In en, this message translates to:
  /// **'Method Not Allowed'**
  String get appHttpExceptionMethodNotAllowedMessage;

  /// No description provided for @appHttpExceptionNotAcceptableMessage.
  ///
  /// In en, this message translates to:
  /// **'Not Acceptable'**
  String get appHttpExceptionNotAcceptableMessage;

  /// No description provided for @appHttpExceptionProxyAuthenticationRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Proxy Authentication Required'**
  String get appHttpExceptionProxyAuthenticationRequiredMessage;

  /// No description provided for @appHttpExceptionRequestTimeoutMessage.
  ///
  /// In en, this message translates to:
  /// **'Request Timeout'**
  String get appHttpExceptionRequestTimeoutMessage;

  /// No description provided for @appHttpExceptionConflictMessage.
  ///
  /// In en, this message translates to:
  /// **'Conflict'**
  String get appHttpExceptionConflictMessage;

  /// No description provided for @appHttpExceptionGoneMessage.
  ///
  /// In en, this message translates to:
  /// **'Gone'**
  String get appHttpExceptionGoneMessage;

  /// No description provided for @appHttpExceptionLengthRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Length Required'**
  String get appHttpExceptionLengthRequiredMessage;

  /// No description provided for @appHttpExceptionPreconditionFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Precondition Failed'**
  String get appHttpExceptionPreconditionFailedMessage;

  /// No description provided for @appHttpExceptionPayloadTooLargeMessage.
  ///
  /// In en, this message translates to:
  /// **'Payload Too Large'**
  String get appHttpExceptionPayloadTooLargeMessage;

  /// No description provided for @appHttpExceptionUriTooLongMessage.
  ///
  /// In en, this message translates to:
  /// **'URI Too Long'**
  String get appHttpExceptionUriTooLongMessage;

  /// No description provided for @appHttpExceptionUnsupportedMediaTypeMessage.
  ///
  /// In en, this message translates to:
  /// **'Unsupported Media Type'**
  String get appHttpExceptionUnsupportedMediaTypeMessage;

  /// No description provided for @appHttpExceptionRangeNotSatisfiableMessage.
  ///
  /// In en, this message translates to:
  /// **'Range Not Satisfiable'**
  String get appHttpExceptionRangeNotSatisfiableMessage;

  /// No description provided for @appHttpExceptionExpectationFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Expectation Failed'**
  String get appHttpExceptionExpectationFailedMessage;

  /// No description provided for @appHttpExceptionIAmATeapotMessage.
  ///
  /// In en, this message translates to:
  /// **'I\'m a teapot'**
  String get appHttpExceptionIAmATeapotMessage;

  /// No description provided for @appHttpExceptionMisdirectedRequestMessage.
  ///
  /// In en, this message translates to:
  /// **'Misdirected Request'**
  String get appHttpExceptionMisdirectedRequestMessage;

  /// No description provided for @appHttpExceptionUnprocessableEntityMessage.
  ///
  /// In en, this message translates to:
  /// **'Unprocessable Entity'**
  String get appHttpExceptionUnprocessableEntityMessage;

  /// No description provided for @appHttpExceptionLockedMessage.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get appHttpExceptionLockedMessage;

  /// No description provided for @appHttpExceptionFailedDependencyMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed Dependency'**
  String get appHttpExceptionFailedDependencyMessage;

  /// No description provided for @appHttpExceptionTooEarlyMessage.
  ///
  /// In en, this message translates to:
  /// **'Too Early'**
  String get appHttpExceptionTooEarlyMessage;

  /// No description provided for @appHttpExceptionUpgradeRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Upgrade Required'**
  String get appHttpExceptionUpgradeRequiredMessage;

  /// No description provided for @appHttpExceptionPreconditionRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Precondition Required'**
  String get appHttpExceptionPreconditionRequiredMessage;

  /// No description provided for @appHttpExceptionTooManyRequestsMessage.
  ///
  /// In en, this message translates to:
  /// **'Too Many Requests'**
  String get appHttpExceptionTooManyRequestsMessage;

  /// No description provided for @appHttpExceptionRequestHeaderFieldsTooLargeMessage.
  ///
  /// In en, this message translates to:
  /// **'Request Header Fields Too Large'**
  String get appHttpExceptionRequestHeaderFieldsTooLargeMessage;

  /// No description provided for @appHttpExceptionUnavailableForLegalReasonsMessage.
  ///
  /// In en, this message translates to:
  /// **'Unavailable For Legal Reasons'**
  String get appHttpExceptionUnavailableForLegalReasonsMessage;

  /// No description provided for @appHttpExceptionInternalServerErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Internal Server Error'**
  String get appHttpExceptionInternalServerErrorMessage;

  /// No description provided for @appHttpExceptionNotImplementedMessage.
  ///
  /// In en, this message translates to:
  /// **'Not Implemented'**
  String get appHttpExceptionNotImplementedMessage;

  /// No description provided for @appHttpExceptionBadGatewayMessage.
  ///
  /// In en, this message translates to:
  /// **'Bad Gateway'**
  String get appHttpExceptionBadGatewayMessage;

  /// No description provided for @appHttpExceptionServiceUnavailableMessage.
  ///
  /// In en, this message translates to:
  /// **'Service Unavailable'**
  String get appHttpExceptionServiceUnavailableMessage;

  /// No description provided for @appHttpExceptionGatewayTimeoutMessage.
  ///
  /// In en, this message translates to:
  /// **'Gateway Timeout'**
  String get appHttpExceptionGatewayTimeoutMessage;

  /// No description provided for @appHttpExceptionHttpVersionNotSupportedMessage.
  ///
  /// In en, this message translates to:
  /// **'HTTP Version Not Supported'**
  String get appHttpExceptionHttpVersionNotSupportedMessage;

  /// No description provided for @appHttpExceptionVariantAlsoNegotiatesMessage.
  ///
  /// In en, this message translates to:
  /// **'Variant Also Negotiates'**
  String get appHttpExceptionVariantAlsoNegotiatesMessage;

  /// No description provided for @appHttpExceptionInsufficientStorageMessage.
  ///
  /// In en, this message translates to:
  /// **'Insufficient Storage'**
  String get appHttpExceptionInsufficientStorageMessage;

  /// No description provided for @appHttpExceptionLoopDetectedMessage.
  ///
  /// In en, this message translates to:
  /// **'Loop Detected'**
  String get appHttpExceptionLoopDetectedMessage;

  /// No description provided for @appHttpExceptionNotExtendedMessage.
  ///
  /// In en, this message translates to:
  /// **'Not Extended'**
  String get appHttpExceptionNotExtendedMessage;

  /// No description provided for @appHttpExceptionNetworkAuthenticationRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Network Authentication Required'**
  String get appHttpExceptionNetworkAuthenticationRequiredMessage;

  /// No description provided for @appHttpExceptionDefaultMessage.
  ///
  /// In en, this message translates to:
  /// **'Unknown ({statusCode})'**
  String appHttpExceptionDefaultMessage(int statusCode);

  /// No description provided for @aboutAppTitle.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutAppTitle;

  /// No description provided for @appLogListTitle.
  ///
  /// In en, this message translates to:
  /// **'App Log'**
  String get appLogListTitle;

  /// No description provided for @devToolsTitle.
  ///
  /// In en, this message translates to:
  /// **'Development Tools'**
  String get devToolsTitle;

  /// No description provided for @devToolsCrashReportTest.
  ///
  /// In en, this message translates to:
  /// **'Crash Report Test'**
  String get devToolsCrashReportTest;

  /// No description provided for @localeSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get localeSettingTitle;

  /// No description provided for @localeSettingSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get localeSettingSystem;

  /// No description provided for @localeSettingEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get localeSettingEnglish;

  /// No description provided for @localeSettingJapanese.
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get localeSettingJapanese;

  /// No description provided for @newsArticleListTitle.
  ///
  /// In en, this message translates to:
  /// **'News Articles'**
  String get newsArticleListTitle;

  /// No description provided for @newsHeadlineCategoryGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get newsHeadlineCategoryGeneral;

  /// No description provided for @newsHeadlineCategoryBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get newsHeadlineCategoryBusiness;

  /// No description provided for @newsHeadlineCategoryEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get newsHeadlineCategoryEntertainment;

  /// No description provided for @newsHeadlineCategoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get newsHeadlineCategoryHealth;

  /// No description provided for @newsHeadlineCategoryScience.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get newsHeadlineCategoryScience;

  /// No description provided for @newsHeadlineCategorySports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get newsHeadlineCategorySports;

  /// No description provided for @newsHeadlineCategoryTechnology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get newsHeadlineCategoryTechnology;

  /// No description provided for @newsArticleSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'News Articles Search'**
  String get newsArticleSearchTitle;

  /// No description provided for @newsArticleSearchFormKeywordLabel.
  ///
  /// In en, this message translates to:
  /// **'Keyword'**
  String get newsArticleSearchFormKeywordLabel;

  /// No description provided for @newsArticleSearchFormKeywordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter a keyword.'**
  String get newsArticleSearchFormKeywordHint;

  /// No description provided for @newsArticleSearchFormKeywordValidateBlank.
  ///
  /// In en, this message translates to:
  /// **'Keyword can\'t be blank.'**
  String get newsArticleSearchFormKeywordValidateBlank;

  /// No description provided for @newsArticleSearchFormKeywordValidateTooLong.
  ///
  /// In en, this message translates to:
  /// **'Keyword is too long. (maximum is {count} characters)'**
  String newsArticleSearchFormKeywordValidateTooLong(int count);

  /// No description provided for @settingTitle.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get settingTitle;

  /// No description provided for @themeSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeSettingTitle;

  /// No description provided for @themeSettingSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSettingSystem;

  /// No description provided for @themeSettingLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeSettingLight;

  /// No description provided for @themeSettingDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeSettingDark;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'ja': return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
