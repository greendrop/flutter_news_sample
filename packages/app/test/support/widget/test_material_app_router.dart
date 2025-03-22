import 'package:app/config/theme/app_theme_data.dart';
import 'package:app/feature/app_router/hook/use_app_router.dart';
import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:flutter/material.dart';
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

    return MaterialApp.router(
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      locale: locale,
      theme: AppThemeData().light,
      darkTheme: AppThemeData().dark,
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
