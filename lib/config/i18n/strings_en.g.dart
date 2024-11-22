///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsGeneralEn general = TranslationsGeneralEn._(_root);
	late final TranslationsAppExceptionEn appException = TranslationsAppExceptionEn._(_root);
	late final TranslationsAppHttpExceptionEn appHttpException = TranslationsAppHttpExceptionEn._(_root);
	late final TranslationsAboutAppEn aboutApp = TranslationsAboutAppEn._(_root);
	late final TranslationsAppLogListEn appLogList = TranslationsAppLogListEn._(_root);
	late final TranslationsDevToolsEn devTools = TranslationsDevToolsEn._(_root);
	late final TranslationsLocaleSettingEn localeSetting = TranslationsLocaleSettingEn._(_root);
	late final TranslationsNewsArticleListEn newsArticleList = TranslationsNewsArticleListEn._(_root);
	late final TranslationsNewsHeadlineCategoryEn newsHeadlineCategory = TranslationsNewsHeadlineCategoryEn._(_root);
	late final TranslationsNewsArticleSearchEn newsArticleSearch = TranslationsNewsArticleSearchEn._(_root);
	late final TranslationsNewsArticleSearchFormEn newsArticleSearchForm = TranslationsNewsArticleSearchFormEn._(_root);
	late final TranslationsSettingEn setting = TranslationsSettingEn._(_root);
	late final TranslationsThemeSettingEn themeSetting = TranslationsThemeSettingEn._(_root);
}

// Path: general
class TranslationsGeneralEn {
	TranslationsGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appTitle => 'News';
	String get ok => 'OK';
	String get ng => 'NG';
	String get yes => 'Yes';
	String get no => 'No';
	String get close => 'Close';
	String get add => 'Add';
	String get create => 'Create';
	String get edit => 'Edit';
	String get update => 'Update';
	String get search => 'Search';
	String get back => 'Back';
	String get share => 'Share';
	String get noDataAvailable => 'No data available.';
}

// Path: appException
class TranslationsAppExceptionEn {
	TranslationsAppExceptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get message => 'An error has occurred.';
}

// Path: appHttpException
class TranslationsAppHttpExceptionEn {
	TranslationsAppHttpExceptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get badRequestMessage => 'Bad Request';
	String get unauthorizedMessage => 'Unauthorized';
	String get paymentRequiredMessage => 'Payment Required';
	String get forbiddenMessage => 'Forbidden';
	String get notFoundMessage => 'Not Found';
	String get methodNotAllowedMessage => 'Method Not Allowed';
	String get notAcceptableMessage => 'Not Acceptable';
	String get proxyAuthenticationRequiredMessage => 'Proxy Authentication Required';
	String get requestTimeoutMessage => 'Request Timeout';
	String get conflictMessage => 'Conflict';
	String get goneMessage => 'Gone';
	String get lengthRequiredMessage => 'Length Required';
	String get preconditionFailedMessage => 'Precondition Failed';
	String get payloadTooLargeMessage => 'Payload Too Large';
	String get uriTooLongMessage => 'URI Too Long';
	String get unsupportedMediaTypeMessage => 'Unsupported Media Type';
	String get rangeNotSatisfiableMessage => 'Range Not Satisfiable';
	String get expectationFailedMessage => 'Expectation Failed';
	String get iAmATeapotMessage => 'I\'m a teapot';
	String get misdirectedRequestMessage => 'Misdirected Request';
	String get unprocessableEntityMessage => 'Unprocessable Entity';
	String get lockedMessage => 'Locked';
	String get failedDependencyMessage => 'Failed Dependency';
	String get tooEarlyMessage => 'Too Early';
	String get upgradeRequiredMessage => 'Upgrade Required';
	String get preconditionRequiredMessage => 'Precondition Required';
	String get tooManyRequestsMessage => 'Too Many Requests';
	String get requestHeaderFieldsTooLargeMessage => 'Request Header Fields Too Large';
	String get unavailableForLegalReasonsMessage => 'Unavailable For Legal Reasons';
	String get internalServerErrorMessage => 'Internal Server Error';
	String get notImplementedMessage => 'Not Implemented';
	String get badGatewayMessage => 'Bad Gateway';
	String get serviceUnavailableMessage => 'Service Unavailable';
	String get gatewayTimeoutMessage => 'Gateway Timeout';
	String get httpVersionNotSupportedMessage => 'HTTP Version Not Supported';
	String get variantAlsoNegotiatesMessage => 'Variant Also Negotiates';
	String get insufficientStorageMessage => 'Insufficient Storage';
	String get loopDetectedMessage => 'Loop Detected';
	String get notExtendedMessage => 'Not Extended';
	String get networkAuthenticationRequiredMessage => 'Network Authentication Required';
	String defaultMessage({required Object statusCode}) => 'Unknown (${statusCode})';
}

// Path: aboutApp
class TranslationsAboutAppEn {
	TranslationsAboutAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'About App';
}

// Path: appLogList
class TranslationsAppLogListEn {
	TranslationsAppLogListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'App Log';
}

// Path: devTools
class TranslationsDevToolsEn {
	TranslationsDevToolsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Development Tools';
	String get crashReportTest => 'Crash Report Test';
}

// Path: localeSetting
class TranslationsLocaleSettingEn {
	TranslationsLocaleSettingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Language';
	String get system => 'System';
	String get english => 'English';
	String get japanese => '日本語';
}

// Path: newsArticleList
class TranslationsNewsArticleListEn {
	TranslationsNewsArticleListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'News Articles';
}

// Path: newsHeadlineCategory
class TranslationsNewsHeadlineCategoryEn {
	TranslationsNewsHeadlineCategoryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get general => 'General';
	String get business => 'Business';
	String get entertainment => 'Entertainment';
	String get health => 'Health';
	String get science => 'Science';
	String get sports => 'Sports';
	String get technology => 'Technology';
}

// Path: newsArticleSearch
class TranslationsNewsArticleSearchEn {
	TranslationsNewsArticleSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'News Articles Search';
}

// Path: newsArticleSearchForm
class TranslationsNewsArticleSearchFormEn {
	TranslationsNewsArticleSearchFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get keywordLabel => 'Keyword';
	String get keywordHint => 'Enter a keyword.';
	String get keywordValidateBlank => 'Keyword can\'t be blank.';
	String keywordValidateTooLong({required Object count}) => 'Keyword is too long. (maximum is ${count} characters)';
}

// Path: setting
class TranslationsSettingEn {
	TranslationsSettingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Setting';
}

// Path: themeSetting
class TranslationsThemeSettingEn {
	TranslationsThemeSettingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Theme';
	String get system => 'System';
	String get light => 'Light';
	String get dark => 'Dark';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.appTitle': return 'News';
			case 'general.ok': return 'OK';
			case 'general.ng': return 'NG';
			case 'general.yes': return 'Yes';
			case 'general.no': return 'No';
			case 'general.close': return 'Close';
			case 'general.add': return 'Add';
			case 'general.create': return 'Create';
			case 'general.edit': return 'Edit';
			case 'general.update': return 'Update';
			case 'general.search': return 'Search';
			case 'general.back': return 'Back';
			case 'general.share': return 'Share';
			case 'general.noDataAvailable': return 'No data available.';
			case 'appException.message': return 'An error has occurred.';
			case 'appHttpException.badRequestMessage': return 'Bad Request';
			case 'appHttpException.unauthorizedMessage': return 'Unauthorized';
			case 'appHttpException.paymentRequiredMessage': return 'Payment Required';
			case 'appHttpException.forbiddenMessage': return 'Forbidden';
			case 'appHttpException.notFoundMessage': return 'Not Found';
			case 'appHttpException.methodNotAllowedMessage': return 'Method Not Allowed';
			case 'appHttpException.notAcceptableMessage': return 'Not Acceptable';
			case 'appHttpException.proxyAuthenticationRequiredMessage': return 'Proxy Authentication Required';
			case 'appHttpException.requestTimeoutMessage': return 'Request Timeout';
			case 'appHttpException.conflictMessage': return 'Conflict';
			case 'appHttpException.goneMessage': return 'Gone';
			case 'appHttpException.lengthRequiredMessage': return 'Length Required';
			case 'appHttpException.preconditionFailedMessage': return 'Precondition Failed';
			case 'appHttpException.payloadTooLargeMessage': return 'Payload Too Large';
			case 'appHttpException.uriTooLongMessage': return 'URI Too Long';
			case 'appHttpException.unsupportedMediaTypeMessage': return 'Unsupported Media Type';
			case 'appHttpException.rangeNotSatisfiableMessage': return 'Range Not Satisfiable';
			case 'appHttpException.expectationFailedMessage': return 'Expectation Failed';
			case 'appHttpException.iAmATeapotMessage': return 'I\'m a teapot';
			case 'appHttpException.misdirectedRequestMessage': return 'Misdirected Request';
			case 'appHttpException.unprocessableEntityMessage': return 'Unprocessable Entity';
			case 'appHttpException.lockedMessage': return 'Locked';
			case 'appHttpException.failedDependencyMessage': return 'Failed Dependency';
			case 'appHttpException.tooEarlyMessage': return 'Too Early';
			case 'appHttpException.upgradeRequiredMessage': return 'Upgrade Required';
			case 'appHttpException.preconditionRequiredMessage': return 'Precondition Required';
			case 'appHttpException.tooManyRequestsMessage': return 'Too Many Requests';
			case 'appHttpException.requestHeaderFieldsTooLargeMessage': return 'Request Header Fields Too Large';
			case 'appHttpException.unavailableForLegalReasonsMessage': return 'Unavailable For Legal Reasons';
			case 'appHttpException.internalServerErrorMessage': return 'Internal Server Error';
			case 'appHttpException.notImplementedMessage': return 'Not Implemented';
			case 'appHttpException.badGatewayMessage': return 'Bad Gateway';
			case 'appHttpException.serviceUnavailableMessage': return 'Service Unavailable';
			case 'appHttpException.gatewayTimeoutMessage': return 'Gateway Timeout';
			case 'appHttpException.httpVersionNotSupportedMessage': return 'HTTP Version Not Supported';
			case 'appHttpException.variantAlsoNegotiatesMessage': return 'Variant Also Negotiates';
			case 'appHttpException.insufficientStorageMessage': return 'Insufficient Storage';
			case 'appHttpException.loopDetectedMessage': return 'Loop Detected';
			case 'appHttpException.notExtendedMessage': return 'Not Extended';
			case 'appHttpException.networkAuthenticationRequiredMessage': return 'Network Authentication Required';
			case 'appHttpException.defaultMessage': return ({required Object statusCode}) => 'Unknown (${statusCode})';
			case 'aboutApp.title': return 'About App';
			case 'appLogList.title': return 'App Log';
			case 'devTools.title': return 'Development Tools';
			case 'devTools.crashReportTest': return 'Crash Report Test';
			case 'localeSetting.title': return 'Language';
			case 'localeSetting.system': return 'System';
			case 'localeSetting.english': return 'English';
			case 'localeSetting.japanese': return '日本語';
			case 'newsArticleList.title': return 'News Articles';
			case 'newsHeadlineCategory.general': return 'General';
			case 'newsHeadlineCategory.business': return 'Business';
			case 'newsHeadlineCategory.entertainment': return 'Entertainment';
			case 'newsHeadlineCategory.health': return 'Health';
			case 'newsHeadlineCategory.science': return 'Science';
			case 'newsHeadlineCategory.sports': return 'Sports';
			case 'newsHeadlineCategory.technology': return 'Technology';
			case 'newsArticleSearch.title': return 'News Articles Search';
			case 'newsArticleSearchForm.keywordLabel': return 'Keyword';
			case 'newsArticleSearchForm.keywordHint': return 'Enter a keyword.';
			case 'newsArticleSearchForm.keywordValidateBlank': return 'Keyword can\'t be blank.';
			case 'newsArticleSearchForm.keywordValidateTooLong': return ({required Object count}) => 'Keyword is too long. (maximum is ${count} characters)';
			case 'setting.title': return 'Setting';
			case 'themeSetting.title': return 'Theme';
			case 'themeSetting.system': return 'System';
			case 'themeSetting.light': return 'Light';
			case 'themeSetting.dark': return 'Dark';
			default: return null;
		}
	}
}

