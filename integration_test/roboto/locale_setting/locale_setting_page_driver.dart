import 'package:flutter_test/flutter_test.dart';

import '../base_driver.dart';
import 'locale_setting_page_findable.dart';

class LocaleSettingPageDriver extends BaseDriver {
  LocaleSettingPageDriver(super.tester);

  final _findable = LocaleSettingPageFindable();

  bool get isShown => _findable.isShown;

  Future<void> waitUntileVisible() async {
    await waitFor(_findable.self);
  }

  Future<void> tapLocaleSystemRadioListTile() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.localeSystemRadioListTile);
  }

  Future<void> tapLocaleEnRadioListTile() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.localeEnRadioListTile);
  }

  Future<void> tapLocaleJaRadioListTile() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.localeJaRadioListTile);
  }

  Future<void> tapBack() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.back);
  }

  Future<void> expectLocaleEnChanged() async {
    await tester.pumpAndSettle();
    expect(find.text('Language'), findsOneWidget);
  }

  Future<void> expectLocaleJaChanged() async {
    await tester.pumpAndSettle();
    expect(find.text('言語'), findsOneWidget);
  }
}
