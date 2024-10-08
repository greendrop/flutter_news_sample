import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_locale.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_form.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('LocaleSettingPage', () {
    Locale? updatedLocale;
    UseLocale buildUseLocale({
      required Locale? state,
    }) {
      UseLocaleReturn useLocale() {
        Future<void> initialize() async {}
        Future<void> update(Locale? locale) async {
          updatedLocale = locale;
        }

        return (
          state: state,
          initialize: initialize,
          update: update,
        );
      }

      return useLocale;
    }

    testWidgets('LocaleSettingFormが表示されること', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            child: TestMaterialApp(
              child: LocaleSettingPage(
                useLocale: buildUseLocale(state: null),
              ),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.byType(LocaleSettingForm), findsOneWidget);
    });

    testWidgets('Radioをタップして、updateが呼ばれること', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            child: TestMaterialApp(
              child: LocaleSettingPage(
                useLocale: buildUseLocale(state: null),
              ),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      final localeSettingFormFinder = find.byType(LocaleSettingForm);
      expect(localeSettingFormFinder, findsOneWidget);

      updatedLocale = null;
      await tester.tap(
        find.descendant(
          of: localeSettingFormFinder,
          matching: find.byKey(const Key('localeEnRadioListTile')),
        ),
      );
      expect(updatedLocale, const Locale('en'));
    });
  });
}
