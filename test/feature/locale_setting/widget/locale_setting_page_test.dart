import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_locale.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_form.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('LocaleSettingPage', () {
    testWidgets('LocaleSettingFormが表示されること', (tester) async {
      UseLocaleReturn useMockLocale() {
        const state = null;
        Future<void> initialize() async {}
        Future<void> update(Locale? locale) async {}

        return (
          state: state,
          initialize: initialize,
          update: update,
        );
      }

      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            child: TestMaterialApp(
              child: LocaleSettingPage(
                useLocale: useMockLocale,
              ),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.byType(LocaleSettingForm), findsOneWidget);
    });

    testWidgets('Radioをタップして、updateが呼ばれること', (tester) async {
      Locale? localeUpdated;

      UseLocaleReturn useMockLocale() {
        const state = null;
        Future<void> initialize() async {}
        Future<void> update(Locale? locale) async {
          localeUpdated = locale;
        }

        return (
          state: state,
          initialize: initialize,
          update: update,
        );
      }

      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            child: TestMaterialApp(
              child: LocaleSettingPage(
                useLocale: useMockLocale,
              ),
            ),
          ),
        );
      });
      await tester.pumpAndSettle();

      final localeSettingFormFinder = find.byType(LocaleSettingForm);
      expect(localeSettingFormFinder, findsOneWidget);

      await tester.tap(
        find.descendant(
          of: localeSettingFormFinder,
          matching: find.byKey(const Key('localeEnRadioListTile')),
        ),
      );

      expect(localeUpdated, const Locale('en'));
    });
  });
}
