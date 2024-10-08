import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/hook/use_theme_mode.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_form.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('ThemeSettingPage', () {
    var updatedThemeMode = ThemeMode.system;
    UseThemeMode buildUseThemeMode() {
      UseThemeModeReturn useThemeMode() {
        const state = ThemeMode.system;
        Future<void> initialize() async {}
        Future<void> update(ThemeMode themeMode) async {
          updatedThemeMode = themeMode;
          return Future.value();
        }

        return (
          state: state,
          initialize: initialize,
          update: update,
        );
      }

      return useThemeMode;
    }

    testWidgets('ThemeSettingFormが表示されること', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            child: TestMaterialApp(
              child: ThemeSettingPage(
                useThemeMode: buildUseThemeMode(),
              ),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.byType(ThemeSettingForm), findsOneWidget);
    });

    testWidgets('Radioをタップして、updateが呼ばれること', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            child: TestMaterialApp(
              child: ThemeSettingPage(
                useThemeMode: buildUseThemeMode(),
              ),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      final themeSettingFormFinder = find.byType(ThemeSettingForm);
      expect(themeSettingFormFinder, findsOneWidget);

      updatedThemeMode = ThemeMode.system;
      await tester.tap(
        find.descendant(
          of: themeSettingFormFinder,
          matching: find.byKey(const Key('themeModeLightRadioListTile')),
        ),
      );
      expect(updatedThemeMode, ThemeMode.light);
    });
  });
}
