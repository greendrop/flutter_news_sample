// ignore: depend_on_referenced_packages
import 'package:app/config/l10n/l10n.g.dart';
// ignore: depend_on_referenced_packages
import 'package:app/config/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/integration/riverpod_integration.dart';

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      appBuilder: (context, child) => UncontrolledProviderScope(
        container: WidgetbookState.of(context).riverpodIntegration?.container ??
            ProviderContainer(),
        child: child,
      ),
      addons: [
        DeviceFrameAddon(
          devices: [
            ...Devices.ios.all,
            ...Devices.android.all,
          ],
          initialDevice: Devices.ios.iPhone13,
        ),
        InspectorAddon(),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: AppThemeData().light),
            WidgetbookTheme(name: 'Dark', data: AppThemeData().dark),
          ],
        ),
        BuilderAddon(
          name: 'SafeArea',
          builder: (_, child) => SafeArea(
            child: child,
          ),
        ),
        AlignmentAddon(),
        LocalizationAddon(
          locales: L10n.supportedLocales,
          localizationsDelegates: L10n.localizationsDelegates,
          initialLocale: L10n.supportedLocales.last,
        ),
      ],
      integrations: [RiverpodIntegration()],
    );
  }
}
