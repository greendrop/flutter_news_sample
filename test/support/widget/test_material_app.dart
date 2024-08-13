import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_news_sample/config/theme/app_theme_data.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';

class TestMaterialApp extends StatelessWidget {
  const TestMaterialApp({
    super.key,
    required this.child,
    this.locale = const Locale('ja'),
    this.themeMode = ThemeMode.system,
  });

  final Widget child;
  final Locale locale;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    LocaleSettings.setLocaleRaw(locale.toString());

    return TranslationProvider(
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
    );
  }
}
