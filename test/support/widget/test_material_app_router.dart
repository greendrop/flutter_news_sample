import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_news_sample/config/theme/app_theme_data.dart';
import 'package:flutter_news_sample/feature/app_router/hook/use_app_router.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestMaterialAppRouter extends HookConsumerWidget {
  const TestMaterialAppRouter({
    super.key,
    this.initialLocation = '/',
    this.locale = const Locale('ja'),
    this.themeMode = ThemeMode.system,
  });

  final String initialLocation;
  final Locale locale;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = useAppRouter(initialLocation: initialLocation);

    useEffect(
      () {
        LocaleSettings.setLocaleRaw(locale.toString());
        return () {};
      },
      [],
    );

    return TranslationProvider(
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            supportedLocales: AppLocaleUtils.supportedLocales,
            locale: TranslationProvider.of(context).flutterLocale,
            theme: AppThemeData().light,
            darkTheme: AppThemeData().dark,
            themeMode: themeMode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
