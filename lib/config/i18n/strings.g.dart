/// Generated file. Do not edit.
///
/// Original: lib/config/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 162 (81 per locale)

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ja(languageCode: 'ja', build: _StringsJa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	late final _StringsGeneralEn general = _StringsGeneralEn._(_root);
	late final _StringsAppExceptionEn appException = _StringsAppExceptionEn._(_root);
	late final _StringsAppHttpExceptionEn appHttpException = _StringsAppHttpExceptionEn._(_root);
	late final _StringsAboutAppEn aboutApp = _StringsAboutAppEn._(_root);
	late final _StringsAppLogListEn appLogList = _StringsAppLogListEn._(_root);
	late final _StringsDevToolsEn devTools = _StringsDevToolsEn._(_root);
	late final _StringsLocaleSettingEn localeSetting = _StringsLocaleSettingEn._(_root);
	late final _StringsNewsArticleListEn newsArticleList = _StringsNewsArticleListEn._(_root);
	late final _StringsNewsHeadlineCategoryEn newsHeadlineCategory = _StringsNewsHeadlineCategoryEn._(_root);
	late final _StringsNewsArticleSearchEn newsArticleSearch = _StringsNewsArticleSearchEn._(_root);
	late final _StringsNewsArticleSearchFormEn newsArticleSearchForm = _StringsNewsArticleSearchFormEn._(_root);
	late final _StringsSettingEn setting = _StringsSettingEn._(_root);
	late final _StringsThemeSettingEn themeSetting = _StringsThemeSettingEn._(_root);
}

// Path: general
class _StringsGeneralEn {
	_StringsGeneralEn._(this._root);

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
class _StringsAppExceptionEn {
	_StringsAppExceptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get message => 'An error has occurred.';
}

// Path: appHttpException
class _StringsAppHttpExceptionEn {
	_StringsAppHttpExceptionEn._(this._root);

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
class _StringsAboutAppEn {
	_StringsAboutAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'About App';
}

// Path: appLogList
class _StringsAppLogListEn {
	_StringsAppLogListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'App Log';
}

// Path: devTools
class _StringsDevToolsEn {
	_StringsDevToolsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Development Tools';
}

// Path: localeSetting
class _StringsLocaleSettingEn {
	_StringsLocaleSettingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Language';
	String get system => 'System';
	String get english => 'English';
	String get japanese => '日本語';
}

// Path: newsArticleList
class _StringsNewsArticleListEn {
	_StringsNewsArticleListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'News Articles';
}

// Path: newsHeadlineCategory
class _StringsNewsHeadlineCategoryEn {
	_StringsNewsHeadlineCategoryEn._(this._root);

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
class _StringsNewsArticleSearchEn {
	_StringsNewsArticleSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'News Articles Search';
}

// Path: newsArticleSearchForm
class _StringsNewsArticleSearchFormEn {
	_StringsNewsArticleSearchFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get keywordLabel => 'Keyword';
	String get keywordHint => 'Enter a keyword.';
	String get keywordValidateBlank => 'Keyword can\'t be blank.';
	String keywordValidateTooLong({required Object count}) => 'Keyword is too long. (maximum is ${count} characters)';
}

// Path: setting
class _StringsSettingEn {
	_StringsSettingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Setting';
}

// Path: themeSetting
class _StringsThemeSettingEn {
	_StringsThemeSettingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Theme';
	String get system => 'System';
	String get light => 'Light';
	String get dark => 'Dark';
}

// Path: <root>
class _StringsJa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralJa general = _StringsGeneralJa._(_root);
	@override late final _StringsAppExceptionJa appException = _StringsAppExceptionJa._(_root);
	@override late final _StringsAppHttpExceptionJa appHttpException = _StringsAppHttpExceptionJa._(_root);
	@override late final _StringsAboutAppJa aboutApp = _StringsAboutAppJa._(_root);
	@override late final _StringsAppLogListJa appLogList = _StringsAppLogListJa._(_root);
	@override late final _StringsDevToolsJa devTools = _StringsDevToolsJa._(_root);
	@override late final _StringsLocaleSettingJa localeSetting = _StringsLocaleSettingJa._(_root);
	@override late final _StringsNewsArticleListJa newsArticleList = _StringsNewsArticleListJa._(_root);
	@override late final _StringsNewsHeadlineCategoryJa newsHeadlineCategory = _StringsNewsHeadlineCategoryJa._(_root);
	@override late final _StringsNewsArticleSearchJa newsArticleSearch = _StringsNewsArticleSearchJa._(_root);
	@override late final _StringsNewsArticleSearchFormJa newsArticleSearchForm = _StringsNewsArticleSearchFormJa._(_root);
	@override late final _StringsSettingJa setting = _StringsSettingJa._(_root);
	@override late final _StringsThemeSettingJa themeSetting = _StringsThemeSettingJa._(_root);
}

// Path: general
class _StringsGeneralJa implements _StringsGeneralEn {
	_StringsGeneralJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'News';
	@override String get ok => 'OK';
	@override String get ng => 'NG';
	@override String get yes => 'はい';
	@override String get no => 'いいえ';
	@override String get close => '閉じる';
	@override String get add => '追加';
	@override String get create => '登録';
	@override String get edit => '編集';
	@override String get update => '更新';
	@override String get search => '検索';
	@override String get back => '戻る';
	@override String get share => '共有';
	@override String get noDataAvailable => 'データがありません。';
}

// Path: appException
class _StringsAppExceptionJa implements _StringsAppExceptionEn {
	_StringsAppExceptionJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get message => 'エラーが発生しました。';
}

// Path: appHttpException
class _StringsAppHttpExceptionJa implements _StringsAppHttpExceptionEn {
	_StringsAppHttpExceptionJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get badRequestMessage => 'リクエストが不正です。';
	@override String get unauthorizedMessage => '認証が必要です。';
	@override String get paymentRequiredMessage => '支払いが必要です。';
	@override String get forbiddenMessage => 'アクセスが禁止されています。';
	@override String get notFoundMessage => 'リソースが見つかりません。';
	@override String get methodNotAllowedMessage => 'メソッドが許可されていません。';
	@override String get notAcceptableMessage => '受理できません。';
	@override String get proxyAuthenticationRequiredMessage => 'プロキシ認証が必要です。';
	@override String get requestTimeoutMessage => 'リクエストがタイムアウトしました。';
	@override String get conflictMessage => '競合が発生しました。';
	@override String get goneMessage => 'リソースが存在しません。';
	@override String get lengthRequiredMessage => '長さが必要です。';
	@override String get preconditionFailedMessage => '前提条件が失敗しました。';
	@override String get payloadTooLargeMessage => 'ペイロードが大きすぎます。';
	@override String get uriTooLongMessage => 'URIが長すぎます。';
	@override String get unsupportedMediaTypeMessage => 'サポートされていないメディアタイプです。';
	@override String get rangeNotSatisfiableMessage => '範囲が満たされていません。';
	@override String get expectationFailedMessage => '期待が失敗しました。';
	@override String get iAmATeapotMessage => '私はティーポットです。';
	@override String get misdirectedRequestMessage => '誤ったリクエストです。';
	@override String get unprocessableEntityMessage => '処理できません。';
	@override String get lockedMessage => 'ロックされています。';
	@override String get failedDependencyMessage => '依存関係が失敗しました。';
	@override String get tooEarlyMessage => '早すぎます。';
	@override String get upgradeRequiredMessage => 'アップグレードが必要です。';
	@override String get preconditionRequiredMessage => '前提条件が必要です。';
	@override String get tooManyRequestsMessage => 'リクエストが多すぎます。';
	@override String get requestHeaderFieldsTooLargeMessage => 'リクエストヘッダーフィールドが大きすぎます。';
	@override String get unavailableForLegalReasonsMessage => '法的な理由で利用できません。';
	@override String get internalServerErrorMessage => 'サーバーエラー';
	@override String get notImplementedMessage => '実装されていません。';
	@override String get badGatewayMessage => '不正なゲートウェイ';
	@override String get serviceUnavailableMessage => 'サービス利用不可';
	@override String get gatewayTimeoutMessage => 'ゲートウェイタイムアウト';
	@override String get httpVersionNotSupportedMessage => 'HTTPバージョンがサポートされていません。';
	@override String get variantAlsoNegotiatesMessage => 'Variant Also Negotiates';
	@override String get insufficientStorageMessage => '容量不足です。';
	@override String get loopDetectedMessage => 'ループが検出されました。';
	@override String get notExtendedMessage => 'Not Extended';
	@override String get networkAuthenticationRequiredMessage => 'ネットワーク認証が必要です。';
	@override String defaultMessage({required Object statusCode}) => '未知のエラー (${statusCode})';
}

// Path: aboutApp
class _StringsAboutAppJa implements _StringsAboutAppEn {
	_StringsAboutAppJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'このアプリについて';
}

// Path: appLogList
class _StringsAppLogListJa implements _StringsAppLogListEn {
	_StringsAppLogListJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アプリログ';
}

// Path: devTools
class _StringsDevToolsJa implements _StringsDevToolsEn {
	_StringsDevToolsJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '開発ツール';
}

// Path: localeSetting
class _StringsLocaleSettingJa implements _StringsLocaleSettingEn {
	_StringsLocaleSettingJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '言語';
	@override String get system => 'システム';
	@override String get english => 'English';
	@override String get japanese => '日本語';
}

// Path: newsArticleList
class _StringsNewsArticleListJa implements _StringsNewsArticleListEn {
	_StringsNewsArticleListJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ニュース記事';
}

// Path: newsHeadlineCategory
class _StringsNewsHeadlineCategoryJa implements _StringsNewsHeadlineCategoryEn {
	_StringsNewsHeadlineCategoryJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get general => '一般';
	@override String get business => 'ビジネス';
	@override String get entertainment => 'エンタメ';
	@override String get health => '健康';
	@override String get science => '科学';
	@override String get sports => 'スポーツ';
	@override String get technology => 'テクノロジー';
}

// Path: newsArticleSearch
class _StringsNewsArticleSearchJa implements _StringsNewsArticleSearchEn {
	_StringsNewsArticleSearchJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ニュース記事検索';
}

// Path: newsArticleSearchForm
class _StringsNewsArticleSearchFormJa implements _StringsNewsArticleSearchFormEn {
	_StringsNewsArticleSearchFormJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get keywordLabel => 'キーワード';
	@override String get keywordHint => 'キーワードを入力してください。';
	@override String get keywordValidateBlank => 'キーワードを入力してください。';
	@override String keywordValidateTooLong({required Object count}) => 'キーワードは${count}文字以内で入力してください。';
}

// Path: setting
class _StringsSettingJa implements _StringsSettingEn {
	_StringsSettingJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
}

// Path: themeSetting
class _StringsThemeSettingJa implements _StringsThemeSettingEn {
	_StringsThemeSettingJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'テーマ';
	@override String get system => 'システム';
	@override String get light => 'ライト';
	@override String get dark => 'ダーク';
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

extension on _StringsJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.appTitle': return 'News';
			case 'general.ok': return 'OK';
			case 'general.ng': return 'NG';
			case 'general.yes': return 'はい';
			case 'general.no': return 'いいえ';
			case 'general.close': return '閉じる';
			case 'general.add': return '追加';
			case 'general.create': return '登録';
			case 'general.edit': return '編集';
			case 'general.update': return '更新';
			case 'general.search': return '検索';
			case 'general.back': return '戻る';
			case 'general.share': return '共有';
			case 'general.noDataAvailable': return 'データがありません。';
			case 'appException.message': return 'エラーが発生しました。';
			case 'appHttpException.badRequestMessage': return 'リクエストが不正です。';
			case 'appHttpException.unauthorizedMessage': return '認証が必要です。';
			case 'appHttpException.paymentRequiredMessage': return '支払いが必要です。';
			case 'appHttpException.forbiddenMessage': return 'アクセスが禁止されています。';
			case 'appHttpException.notFoundMessage': return 'リソースが見つかりません。';
			case 'appHttpException.methodNotAllowedMessage': return 'メソッドが許可されていません。';
			case 'appHttpException.notAcceptableMessage': return '受理できません。';
			case 'appHttpException.proxyAuthenticationRequiredMessage': return 'プロキシ認証が必要です。';
			case 'appHttpException.requestTimeoutMessage': return 'リクエストがタイムアウトしました。';
			case 'appHttpException.conflictMessage': return '競合が発生しました。';
			case 'appHttpException.goneMessage': return 'リソースが存在しません。';
			case 'appHttpException.lengthRequiredMessage': return '長さが必要です。';
			case 'appHttpException.preconditionFailedMessage': return '前提条件が失敗しました。';
			case 'appHttpException.payloadTooLargeMessage': return 'ペイロードが大きすぎます。';
			case 'appHttpException.uriTooLongMessage': return 'URIが長すぎます。';
			case 'appHttpException.unsupportedMediaTypeMessage': return 'サポートされていないメディアタイプです。';
			case 'appHttpException.rangeNotSatisfiableMessage': return '範囲が満たされていません。';
			case 'appHttpException.expectationFailedMessage': return '期待が失敗しました。';
			case 'appHttpException.iAmATeapotMessage': return '私はティーポットです。';
			case 'appHttpException.misdirectedRequestMessage': return '誤ったリクエストです。';
			case 'appHttpException.unprocessableEntityMessage': return '処理できません。';
			case 'appHttpException.lockedMessage': return 'ロックされています。';
			case 'appHttpException.failedDependencyMessage': return '依存関係が失敗しました。';
			case 'appHttpException.tooEarlyMessage': return '早すぎます。';
			case 'appHttpException.upgradeRequiredMessage': return 'アップグレードが必要です。';
			case 'appHttpException.preconditionRequiredMessage': return '前提条件が必要です。';
			case 'appHttpException.tooManyRequestsMessage': return 'リクエストが多すぎます。';
			case 'appHttpException.requestHeaderFieldsTooLargeMessage': return 'リクエストヘッダーフィールドが大きすぎます。';
			case 'appHttpException.unavailableForLegalReasonsMessage': return '法的な理由で利用できません。';
			case 'appHttpException.internalServerErrorMessage': return 'サーバーエラー';
			case 'appHttpException.notImplementedMessage': return '実装されていません。';
			case 'appHttpException.badGatewayMessage': return '不正なゲートウェイ';
			case 'appHttpException.serviceUnavailableMessage': return 'サービス利用不可';
			case 'appHttpException.gatewayTimeoutMessage': return 'ゲートウェイタイムアウト';
			case 'appHttpException.httpVersionNotSupportedMessage': return 'HTTPバージョンがサポートされていません。';
			case 'appHttpException.variantAlsoNegotiatesMessage': return 'Variant Also Negotiates';
			case 'appHttpException.insufficientStorageMessage': return '容量不足です。';
			case 'appHttpException.loopDetectedMessage': return 'ループが検出されました。';
			case 'appHttpException.notExtendedMessage': return 'Not Extended';
			case 'appHttpException.networkAuthenticationRequiredMessage': return 'ネットワーク認証が必要です。';
			case 'appHttpException.defaultMessage': return ({required Object statusCode}) => '未知のエラー (${statusCode})';
			case 'aboutApp.title': return 'このアプリについて';
			case 'appLogList.title': return 'アプリログ';
			case 'devTools.title': return '開発ツール';
			case 'localeSetting.title': return '言語';
			case 'localeSetting.system': return 'システム';
			case 'localeSetting.english': return 'English';
			case 'localeSetting.japanese': return '日本語';
			case 'newsArticleList.title': return 'ニュース記事';
			case 'newsHeadlineCategory.general': return '一般';
			case 'newsHeadlineCategory.business': return 'ビジネス';
			case 'newsHeadlineCategory.entertainment': return 'エンタメ';
			case 'newsHeadlineCategory.health': return '健康';
			case 'newsHeadlineCategory.science': return '科学';
			case 'newsHeadlineCategory.sports': return 'スポーツ';
			case 'newsHeadlineCategory.technology': return 'テクノロジー';
			case 'newsArticleSearch.title': return 'ニュース記事検索';
			case 'newsArticleSearchForm.keywordLabel': return 'キーワード';
			case 'newsArticleSearchForm.keywordHint': return 'キーワードを入力してください。';
			case 'newsArticleSearchForm.keywordValidateBlank': return 'キーワードを入力してください。';
			case 'newsArticleSearchForm.keywordValidateTooLong': return ({required Object count}) => 'キーワードは${count}文字以内で入力してください。';
			case 'setting.title': return '設定';
			case 'themeSetting.title': return 'テーマ';
			case 'themeSetting.system': return 'システム';
			case 'themeSetting.light': return 'ライト';
			case 'themeSetting.dark': return 'ダーク';
			default: return null;
		}
	}
}
