import 'package:app/config/theme/app_theme_data.dart';
import 'package:app/feature/app_logger/hook/use_app_logger_directory.dart';
import 'package:app/feature/app_router/hook/use_app_router.dart';
import 'package:app/feature/locale_setting/hook/use_locale.dart';
import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:app/feature/package_info/hook/use_package_info.dart';
import 'package:app/feature/theme_setting/hook/use_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
        Future.microtask(() async {
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
        Future.microtask(() async {
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
    return child;
  }
}

// MaterialApp.routerでルーティング・ロケール・テーマを設定するWidget
class _AppRootTier4 extends HookConsumerWidget {
  const _AppRootTier4();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = useLocale();
    final themeMode = useThemeMode();
    final appRouter = useMemoized(useAppRouter);

    return MaterialApp.router(
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      locale: locale.state,
      onGenerateTitle: (BuildContext context) =>
          L10n.of(context)!.generalAppTitle,
      theme: AppThemeData().light,
      darkTheme: AppThemeData().dark,
      themeMode: themeMode.state,
      routerConfig: appRouter,
    );
  }
}
