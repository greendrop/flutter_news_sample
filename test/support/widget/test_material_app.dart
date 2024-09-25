import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_news_sample/config/theme/app_theme_data.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'test_provider_scope.dart';
import 'test_translation_provider.dart';

class TestMaterialApp extends HookConsumerWidget {
  const TestMaterialApp({
    super.key,
    required this.child,
    this.locale = const Locale('ja'),
    this.themeMode = ThemeMode.system,
    this.providerScopeOverrides = const [],
    this.withTranslationProvider = true,
  });

  final Widget child;
  final Locale locale;
  final ThemeMode themeMode;
  final List<Override> providerScopeOverrides;
  final bool withTranslationProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (withTranslationProvider) {
      return TestProviderScope(
        providerScopeOverrides: providerScopeOverrides,
        child: TestTranslationProvider(
          locale: locale,
          builder: buildMaterialApp,
        ),
      );
    }

    return TestProviderScope(
      providerScopeOverrides: providerScopeOverrides,
      child: buildMaterialApp(context),
    );
  }

  Widget buildMaterialApp(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: AppLocaleUtils.supportedLocales,
      locale: withTranslationProvider
          ? TranslationProvider.of(context).flutterLocale
          : locale,
      theme: AppThemeData().light,
      darkTheme: AppThemeData().dark,
      themeMode: themeMode,
      home: child,
    );
  }
}
