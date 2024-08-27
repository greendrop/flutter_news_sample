import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_news_sample/config/theme/app_theme_data.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logger.dart';

class TestMaterialApp extends StatelessWidget {
  const TestMaterialApp({
    super.key,
    required this.child,
    this.locale = const Locale('ja'),
    this.themeMode = ThemeMode.system,
    this.providerScopeOverrides = const [],
  });

  final Widget child;
  final Locale locale;
  final ThemeMode themeMode;
  final List<Override> providerScopeOverrides;

  @override
  Widget build(BuildContext context) {
    LocaleSettings.setLocaleRaw(locale.toString());

    return ProviderScope(
      overrides: [
        // ignore: scoped_providers_should_specify_dependencies
        appLoggerProvider.overrideWithValue(buildAppTestLogger()),
        ...providerScopeOverrides,
      ],
      child: TranslationProvider(
        child: Builder(
          builder: (context) {
            return MaterialApp(
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              supportedLocales: AppLocaleUtils.supportedLocales,
              locale: TranslationProvider.of(context).flutterLocale,
              theme: AppThemeData().light,
              darkTheme: AppThemeData().dark,
              themeMode: themeMode,
              home: child,
            );
          },
        ),
      ),
    );
  }
}
