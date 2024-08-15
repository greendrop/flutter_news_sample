import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('ThemeSettingForm', () {
    testWidgets('初期値が反映されていること', (tester) async {
      final initialThemeMode =
          [ThemeMode.system, ThemeMode.light, ThemeMode.dark].sample(1).first;

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: ThemeSettingForm(
                initialThemeMode: initialThemeMode,
                onSubmit: (value) {},
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        tester
            .widget<RadioListTile<ThemeMode>>(
              find
                  .descendant(
                    of: find.byKey(const Key('themeModeRadioListTiles')),
                    matching: find.byType(RadioListTile<ThemeMode>),
                  )
                  .first,
            )
            .groupValue,
        initialThemeMode,
      );
    });

    testWidgets('Radioをタップして、onSubmitが呼ばれること', (tester) async {
      var themeMode = ThemeMode.system;

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: ThemeSettingForm(
                initialThemeMode: ThemeMode.system,
                onSubmit: (value) {
                  themeMode = value;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('themeModeLightRadioListTile')));
      expect(themeMode, ThemeMode.light);
    });
  });
}
