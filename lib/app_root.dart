import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_news_sample/config/i18n/strings.g.dart';
import 'package:flutter_news_sample/config/theme/app_theme_data.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger_directory.dart';
import 'package:flutter_news_sample/feature/app_router/hook/use_app_router.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_locale.dart';
import 'package:flutter_news_sample/feature/package_info/hook/use_package_info.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_theme_mode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppRoot extends HookConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _AppRootTier1(
      child: _AppRootTier2(
        child: _AppRootTier3(
          child: _AppRootTier4(),
        ),
      ),
    );
  }
}

// AppLogger初期化処理を行うWidget
class _AppRootTier1 extends HookConsumerWidget {
  const _AppRootTier1({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitialized = useState(false);
    final appLoggerDirectory = useAppLoggerDirectory();

    useEffect(
      () {
        Future.delayed(Duration.zero, () async {
          await appLoggerDirectory.initialize();
          isInitialized.value = true;
        });

        return () {};
      },
      [],
    );

    if (!isInitialized.value) {
      return const Center(child: CircularProgressIndicator());
    }
    return child;
  }
}

// AppLogger以外の初期化処理を行うWidget
class _AppRootTier2 extends HookConsumerWidget {
  const _AppRootTier2({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitialized = useState(false);
    final packageInfo = usePackageInfo();
    final themeMode = useThemeMode();
    final locale = useLocale();

    useEffect(
      () {
        Future.delayed(Duration.zero, () async {
          await packageInfo.initialize();
          await themeMode.initialize();
          await locale.initialize();

          isInitialized.value = true;
        });

        return () {};
      },
      [],
    );

    if (!isInitialized.value) {
      return const Center(child: CircularProgressIndicator());
    }

    return child;
  }
}

// 画面表示を行わない常時監視・処理を行うWidget
class _AppRootTier3 extends HookConsumerWidget {
  const _AppRootTier3({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = useLocale();

    useEffect(
      () {
        Future.delayed(Duration.zero, () {
          if (locale.state == null) {
            LocaleSettings.useDeviceLocale();
          } else {
            LocaleSettings.setLocaleRaw(locale.state!.toString());
          }
        });
        return () {};
      },
      [locale.state],
    );

    return child;
  }
}

// MaterialApp.routerでルーティング・ロケール・テーマを設定するWidget
class _AppRootTier4 extends HookConsumerWidget {
  const _AppRootTier4();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = useThemeMode();
    final appRouter = useMemoized(useAppRouter);

    return MaterialApp.router(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: AppLocaleUtils.supportedLocales,
      locale: TranslationProvider.of(context).flutterLocale,
      onGenerateTitle: (BuildContext context) =>
          Translations.of(context).general.appTitle,
      theme: AppThemeData().light,
      darkTheme: AppThemeData().dark,
      themeMode: themeMode.state,
      routerConfig: appRouter,
    );
  }
}
