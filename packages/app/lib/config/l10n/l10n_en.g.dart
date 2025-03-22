import 'package:intl/intl.dart' as intl;

import 'l10n.g.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get generalAppTitle => 'News';

  @override
  String get generalOk => 'OK';

  @override
  String get generalNg => 'NG';

  @override
  String get generalYes => 'Yes';

  @override
  String get generalNo => 'No';

  @override
  String get generalClose => 'Close';

  @override
  String get generalAdd => 'Add';

  @override
  String get generalCreate => 'Create';

  @override
  String get generalEdit => 'Edit';

  @override
  String get generalUpdate => 'Update';

  @override
  String get generalSearch => 'Search';

  @override
  String get generalBack => 'Back';

  @override
  String get generalShare => 'Share';

  @override
  String get generalNoDataAvailable => 'No data available.';

  @override
  String get appExceptionMessage => 'An error has occurred.';

  @override
  String get appHttpExceptionBadRequestMessage => 'Bad Request';

  @override
  String get appHttpExceptionUnauthorizedMessage => 'Unauthorized';

  @override
  String get appHttpExceptionPaymentRequiredMessage => 'Payment Required';

  @override
  String get appHttpExceptionForbiddenMessage => 'Forbidden';

  @override
  String get appHttpExceptionNotFoundMessage => 'Not Found';

  @override
  String get appHttpExceptionMethodNotAllowedMessage => 'Method Not Allowed';

  @override
  String get appHttpExceptionNotAcceptableMessage => 'Not Acceptable';

  @override
  String get appHttpExceptionProxyAuthenticationRequiredMessage => 'Proxy Authentication Required';

  @override
  String get appHttpExceptionRequestTimeoutMessage => 'Request Timeout';

  @override
  String get appHttpExceptionConflictMessage => 'Conflict';

  @override
  String get appHttpExceptionGoneMessage => 'Gone';

  @override
  String get appHttpExceptionLengthRequiredMessage => 'Length Required';

  @override
  String get appHttpExceptionPreconditionFailedMessage => 'Precondition Failed';

  @override
  String get appHttpExceptionPayloadTooLargeMessage => 'Payload Too Large';

  @override
  String get appHttpExceptionUriTooLongMessage => 'URI Too Long';

  @override
  String get appHttpExceptionUnsupportedMediaTypeMessage => 'Unsupported Media Type';

  @override
  String get appHttpExceptionRangeNotSatisfiableMessage => 'Range Not Satisfiable';

  @override
  String get appHttpExceptionExpectationFailedMessage => 'Expectation Failed';

  @override
  String get appHttpExceptionIAmATeapotMessage => 'I\'m a teapot';

  @override
  String get appHttpExceptionMisdirectedRequestMessage => 'Misdirected Request';

  @override
  String get appHttpExceptionUnprocessableEntityMessage => 'Unprocessable Entity';

  @override
  String get appHttpExceptionLockedMessage => 'Locked';

  @override
  String get appHttpExceptionFailedDependencyMessage => 'Failed Dependency';

  @override
  String get appHttpExceptionTooEarlyMessage => 'Too Early';

  @override
  String get appHttpExceptionUpgradeRequiredMessage => 'Upgrade Required';

  @override
  String get appHttpExceptionPreconditionRequiredMessage => 'Precondition Required';

  @override
  String get appHttpExceptionTooManyRequestsMessage => 'Too Many Requests';

  @override
  String get appHttpExceptionRequestHeaderFieldsTooLargeMessage => 'Request Header Fields Too Large';

  @override
  String get appHttpExceptionUnavailableForLegalReasonsMessage => 'Unavailable For Legal Reasons';

  @override
  String get appHttpExceptionInternalServerErrorMessage => 'Internal Server Error';

  @override
  String get appHttpExceptionNotImplementedMessage => 'Not Implemented';

  @override
  String get appHttpExceptionBadGatewayMessage => 'Bad Gateway';

  @override
  String get appHttpExceptionServiceUnavailableMessage => 'Service Unavailable';

  @override
  String get appHttpExceptionGatewayTimeoutMessage => 'Gateway Timeout';

  @override
  String get appHttpExceptionHttpVersionNotSupportedMessage => 'HTTP Version Not Supported';

  @override
  String get appHttpExceptionVariantAlsoNegotiatesMessage => 'Variant Also Negotiates';

  @override
  String get appHttpExceptionInsufficientStorageMessage => 'Insufficient Storage';

  @override
  String get appHttpExceptionLoopDetectedMessage => 'Loop Detected';

  @override
  String get appHttpExceptionNotExtendedMessage => 'Not Extended';

  @override
  String get appHttpExceptionNetworkAuthenticationRequiredMessage => 'Network Authentication Required';

  @override
  String appHttpExceptionDefaultMessage(int statusCode) {
    final intl.NumberFormat statusCodeNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String statusCodeString = statusCodeNumberFormat.format(statusCode);

    return 'Unknown ($statusCodeString)';
  }

  @override
  String get aboutAppTitle => 'About App';

  @override
  String get appLogListTitle => 'App Log';

  @override
  String get devToolsTitle => 'Development Tools';

  @override
  String get devToolsCrashReportTest => 'Crash Report Test';

  @override
  String get localeSettingTitle => 'Language';

  @override
  String get localeSettingSystem => 'System';

  @override
  String get localeSettingEnglish => 'English';

  @override
  String get localeSettingJapanese => '日本語';

  @override
  String get newsArticleListTitle => 'News Articles';

  @override
  String get newsHeadlineCategoryGeneral => 'General';

  @override
  String get newsHeadlineCategoryBusiness => 'Business';

  @override
  String get newsHeadlineCategoryEntertainment => 'Entertainment';

  @override
  String get newsHeadlineCategoryHealth => 'Health';

  @override
  String get newsHeadlineCategoryScience => 'Science';

  @override
  String get newsHeadlineCategorySports => 'Sports';

  @override
  String get newsHeadlineCategoryTechnology => 'Technology';

  @override
  String get newsArticleSearchTitle => 'News Articles Search';

  @override
  String get newsArticleSearchFormKeywordLabel => 'Keyword';

  @override
  String get newsArticleSearchFormKeywordHint => 'Enter a keyword.';

  @override
  String get newsArticleSearchFormKeywordValidateBlank => 'Keyword can\'t be blank.';

  @override
  String newsArticleSearchFormKeywordValidateTooLong(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Keyword is too long. (maximum is $countString characters)';
  }

  @override
  String get settingTitle => 'Setting';

  @override
  String get themeSettingTitle => 'Theme';

  @override
  String get themeSettingSystem => 'System';

  @override
  String get themeSettingLight => 'Light';

  @override
  String get themeSettingDark => 'Dark';
}
