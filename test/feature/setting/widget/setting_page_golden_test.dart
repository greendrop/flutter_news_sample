import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/dev_tool/hook/use_push_dev_tool_page.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_push_locale_setting_page.dart';
import 'package:flutter_news_sample/feature/setting/hook/use_show_app_about_dialog.dart';
import 'package:flutter_news_sample/feature/setting/widget/setting_page.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_push_theme_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/alchemist/golden_test_device_scenario.dart';
import '../../../support/widget/test_material_app.dart';
import '../../../support/widget/test_translation_provider.dart';

void main() {
  Widget buildSettingPage() {
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

    UseShowAppAboutDialogReturn useShowAppAboutDialoge() {
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

    return TestMaterialApp(
      withTranslationProvider: false,
      child: SettingPage(
        usePushLocaleSettingPage: usePushLocaleSettingPage,
        usePushThemeSettingPage: usePushThemeSettingPage,
        useShowAppAboutDialog: useShowAppAboutDialoge,
        usePushDevToolPage: usePushDevToolPage,
        showDevTool: false,
      ),
    );
  }

  group('SettingPage Golden Test', () {
    final allDevices = Device.all;

    goldenTest(
      'Default',
      fileName: 'setting_page_default',
      builder: () {
        return TestTranslationProvider(
          builder: (context) {
            final children = <Widget>[];
            for (final device in allDevices) {
              children.add(
                GoldenTestDeviceScenario(
                  device: device,
                  name: 'SettingPage Default',
                  builder: buildSettingPage,
                ),
              );
            }

            return GoldenTestGroup(
              columns: allDevices.length,
              children: children,
            );
          },
        );
      },
    );
  });
}
