/// Generated file. Do not edit.
///
/// Original: lib/config/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 48 (24 per locale)

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
	late final _StringsAboutAppEn aboutApp = _StringsAboutAppEn._(_root);
	late final _StringsAppLogListEn appLogList = _StringsAppLogListEn._(_root);
	late final _StringsDevToolsEn devTools = _StringsDevToolsEn._(_root);
	late final _StringsLocaleSettingEn localeSetting = _StringsLocaleSettingEn._(_root);
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
	String get noDataAvailable => 'No data available.';
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
	@override late final _StringsAboutAppJa aboutApp = _StringsAboutAppJa._(_root);
	@override late final _StringsAppLogListJa appLogList = _StringsAppLogListJa._(_root);
	@override late final _StringsDevToolsJa devTools = _StringsDevToolsJa._(_root);
	@override late final _StringsLocaleSettingJa localeSetting = _StringsLocaleSettingJa._(_root);
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
	@override String get noDataAvailable => 'データがありません。';
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
			case 'general.noDataAvailable': return 'No data available.';
			case 'aboutApp.title': return 'About App';
			case 'appLogList.title': return 'App Log';
			case 'devTools.title': return 'Development Tools';
			case 'localeSetting.title': return 'Language';
			case 'localeSetting.system': return 'System';
			case 'localeSetting.english': return 'English';
			case 'localeSetting.japanese': return '日本語';
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
			case 'general.noDataAvailable': return 'データがありません。';
			case 'aboutApp.title': return 'このアプリについて';
			case 'appLogList.title': return 'アプリログ';
			case 'devTools.title': return '開発ツール';
			case 'localeSetting.title': return '言語';
			case 'localeSetting.system': return 'システム';
			case 'localeSetting.english': return 'English';
			case 'localeSetting.japanese': return '日本語';
			case 'setting.title': return '設定';
			case 'themeSetting.title': return 'テーマ';
			case 'themeSetting.system': return 'システム';
			case 'themeSetting.light': return 'ライト';
			case 'themeSetting.dark': return 'ダーク';
			default: return null;
		}
	}
}
