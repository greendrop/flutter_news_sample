///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsJa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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

	late final TranslationsJa _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsGeneralJa general = _TranslationsGeneralJa._(_root);
	@override late final _TranslationsAppExceptionJa appException = _TranslationsAppExceptionJa._(_root);
	@override late final _TranslationsAppHttpExceptionJa appHttpException = _TranslationsAppHttpExceptionJa._(_root);
	@override late final _TranslationsAboutAppJa aboutApp = _TranslationsAboutAppJa._(_root);
	@override late final _TranslationsAppLogListJa appLogList = _TranslationsAppLogListJa._(_root);
	@override late final _TranslationsDevToolsJa devTools = _TranslationsDevToolsJa._(_root);
	@override late final _TranslationsLocaleSettingJa localeSetting = _TranslationsLocaleSettingJa._(_root);
	@override late final _TranslationsNewsArticleListJa newsArticleList = _TranslationsNewsArticleListJa._(_root);
	@override late final _TranslationsNewsHeadlineCategoryJa newsHeadlineCategory = _TranslationsNewsHeadlineCategoryJa._(_root);
	@override late final _TranslationsNewsArticleSearchJa newsArticleSearch = _TranslationsNewsArticleSearchJa._(_root);
	@override late final _TranslationsNewsArticleSearchFormJa newsArticleSearchForm = _TranslationsNewsArticleSearchFormJa._(_root);
	@override late final _TranslationsSettingJa setting = _TranslationsSettingJa._(_root);
	@override late final _TranslationsThemeSettingJa themeSetting = _TranslationsThemeSettingJa._(_root);
}

// Path: general
class _TranslationsGeneralJa implements TranslationsGeneralEn {
	_TranslationsGeneralJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsAppExceptionJa implements TranslationsAppExceptionEn {
	_TranslationsAppExceptionJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get message => 'エラーが発生しました。';
}

// Path: appHttpException
class _TranslationsAppHttpExceptionJa implements TranslationsAppHttpExceptionEn {
	_TranslationsAppHttpExceptionJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsAboutAppJa implements TranslationsAboutAppEn {
	_TranslationsAboutAppJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'このアプリについて';
}

// Path: appLogList
class _TranslationsAppLogListJa implements TranslationsAppLogListEn {
	_TranslationsAppLogListJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アプリログ';
}

// Path: devTools
class _TranslationsDevToolsJa implements TranslationsDevToolsEn {
	_TranslationsDevToolsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '開発ツール';
	@override String get crashReportTest => 'クラッシュレポートテスト';
}

// Path: localeSetting
class _TranslationsLocaleSettingJa implements TranslationsLocaleSettingEn {
	_TranslationsLocaleSettingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '言語';
	@override String get system => 'システム';
	@override String get english => 'English';
	@override String get japanese => '日本語';
}

// Path: newsArticleList
class _TranslationsNewsArticleListJa implements TranslationsNewsArticleListEn {
	_TranslationsNewsArticleListJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ニュース記事';
}

// Path: newsHeadlineCategory
class _TranslationsNewsHeadlineCategoryJa implements TranslationsNewsHeadlineCategoryEn {
	_TranslationsNewsHeadlineCategoryJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsNewsArticleSearchJa implements TranslationsNewsArticleSearchEn {
	_TranslationsNewsArticleSearchJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ニュース記事検索';
}

// Path: newsArticleSearchForm
class _TranslationsNewsArticleSearchFormJa implements TranslationsNewsArticleSearchFormEn {
	_TranslationsNewsArticleSearchFormJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get keywordLabel => 'キーワード';
	@override String get keywordHint => 'キーワードを入力してください。';
	@override String get keywordValidateBlank => 'キーワードを入力してください。';
	@override String keywordValidateTooLong({required Object count}) => 'キーワードは${count}文字以内で入力してください。';
}

// Path: setting
class _TranslationsSettingJa implements TranslationsSettingEn {
	_TranslationsSettingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
}

// Path: themeSetting
class _TranslationsThemeSettingJa implements TranslationsThemeSettingEn {
	_TranslationsThemeSettingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'テーマ';
	@override String get system => 'システム';
	@override String get light => 'ライト';
	@override String get dark => 'ダーク';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsJa {
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
			case 'devTools.crashReportTest': return 'クラッシュレポートテスト';
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

