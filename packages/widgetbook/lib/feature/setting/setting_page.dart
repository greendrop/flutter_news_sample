import 'package:app/feature/dev_tool/hook/use_push_dev_tool_page.dart';
import 'package:app/feature/locale_setting/hook/use_push_locale_setting_page.dart';
import 'package:app/feature/setting/hook/use_show_app_about_dialog.dart';
import 'package:app/feature/setting/widget/setting_page.dart' as feature;
import 'package:app/feature/theme_setting/hook/use_push_theme_setting_page.dart';
import 'package:app/widget/scaffold_with_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({required this.showDevTool, super.key});

  final bool showDevTool;

  @override
  Widget build(BuildContext context) {
    UsePushLocaleSettingPageReturn usePushLocaleSettingPage() {
      Future<void> run() {
        return Future.value();
      }

      return (run: run);
    }

    UsePushThemeSettingPageReturn usePushThemeSettingPage() {
      Future<void> run() {
        return Future.value();
      }

      return (run: run);
    }

    UseShowAppAboutDialogReturn useShowAppAboutDialog() {
      Future<void> run() {
        return Future.value();
      }

      return (run: run);
    }

    UsePushDevToolPageReturn usePushDevToolPage() {
      Future<void> run() {
        return Future.value();
      }

      return (run: run);
    }

    return ScaffoldWithNavBar(
      currentIndex: 2,
      onDestinationSelected: (index) {},
      child: feature.SettingPage(
        usePushLocaleSettingPage: usePushLocaleSettingPage,
        usePushThemeSettingPage: usePushThemeSettingPage,
        useShowAppAboutDialog: useShowAppAboutDialog,
        usePushDevToolPage: usePushDevToolPage,
        showDevTool: showDevTool,
      ),
    );
  }
}

@UseCase(name: 'Default', type: SettingPage)
Widget buildSettingDefaultUseCase(BuildContext context) {
  return const SettingPage(showDevTool: false);
}

@UseCase(name: 'Default With Dev Tool', type: SettingPage)
Widget buildSettingDefaultWithDevToolUseCase(BuildContext context) {
  return const SettingPage(showDevTool: true);
}
