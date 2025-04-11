import 'package:app/config/theme/app_theme_data.dart';
import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'test_provider_scope.dart';

class TestMaterialApp extends HookConsumerWidget {
  const TestMaterialApp({
    required this.child,
    this.locale = const Locale('ja'),
    this.themeMode = ThemeMode.system,
    this.providerScopeOverrides = const [],
    this.withTranslationProvider = true,
    super.key,
  });

  final Widget child;
  final Locale locale;
  final ThemeMode themeMode;
  final List<Override> providerScopeOverrides;
  final bool withTranslationProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TestProviderScope(
      providerScopeOverrides: providerScopeOverrides,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        locale: locale,
        theme: AppThemeData().light,
        darkTheme: AppThemeData().dark,
        themeMode: themeMode,
        home: child,
      ),
    );
  }
}
