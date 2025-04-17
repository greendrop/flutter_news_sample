import 'package:app/feature/theme_setting/hook/use_theme_mode.dart';
import 'package:app/feature/theme_setting/widget/theme_setting_page.dart'
    as feature;
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ThemeSettingPage extends StatelessWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    UseThemeModeReturn useThemeMode() {
      const state = ThemeMode.system;
      Future<void> initialize() async {}
      Future<void> update(ThemeMode themeMode) async {}

      return (state: state, initialize: initialize, update: update);
    }

    return feature.ThemeSettingPage(useThemeMode: useThemeMode);
  }
}

Widget buildThemeSettingPageDefault(BuildContext context) {
  return const ThemeSettingPage();
}

@UseCase(name: 'Default', type: ThemeSettingPage)
Widget buildThemeSettingPageDefaultUseCase(BuildContext context) {
  return buildThemeSettingPageDefault(context);
}
