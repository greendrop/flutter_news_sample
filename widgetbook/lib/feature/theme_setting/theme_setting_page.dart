import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_theme_mode.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_page.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ThemeSettingPage extends StatelessWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    UseThemeModeReturn useThemeMode() {
      const state = ThemeMode.system;
      Future<void> initialize() async {}
      Future<void> update(ThemeMode themeMode) async {}

      return (
        state: state,
        initialize: initialize,
        update: update,
      );
    }

    return feature.ThemeSettingPage(
      useThemeMode: useThemeMode,
    );
  }
}

@UseCase(
  name: 'Default',
  type: ThemeSettingPage,
)
Widget buildThemeSettingPageDefaultUseCase(BuildContext context) {
  return const ThemeSettingPage();
}
