import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('LocaleSettingForm', () {
    testWidgets('初期値が反映されていること', (tester) async {
      final initialLocale =
          [null, const Locale('en'), const Locale('ja')].sample(1).first;

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: LocaleSettingForm(
                initialLocale: initialLocale,
                onSubmit: (value) {},
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        tester
            .widget<RadioListTile<Locale?>>(
              find
                  .descendant(
                    of: find.byKey(const Key('localeRadioListTiles')),
                    matching: find.byType(RadioListTile<Locale?>),
                  )
                  .first,
            )
            .groupValue,
        initialLocale,
      );
    });

    testWidgets('Radioをタップして、onSubmitが呼ばれること', (tester) async {
      Locale? locale;

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: LocaleSettingForm(
                initialLocale: null,
                onSubmit: (value) {
                  locale = value;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('localeEnRadioListTile')));
      expect(locale, const Locale('en'));
    });
  });
}
