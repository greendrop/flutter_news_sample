import 'package:flutter_test/flutter_test.dart';

import '../base_driver.dart';
import 'setting_page_findable.dart';

class SettingPageDriver extends BaseDriver {
  SettingPageDriver(super.tester);

  final _findable = SettingPageFindable();

  bool get isShown => _findable.isShown;

  Future<void> waitUntileVisible() async {
    await waitFor(_findable.self);
  }

  Future<void> tapLocaleListTile() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.localeListTile);
  }

  Future<void> tapThemeListTile() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.themeListTile);
  }

  Future<void> tapAppAboutListTile() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.appAboutListTile);
  }

  Future<void> tapNewsArticlesNavigationIcon() async {
    await tester.tap(_findable.newsArticlesNavigationIcon);
  }

  Future<void> tapNewsArticlesSearchNavigationIcon() async {
    await tester.tap(_findable.newsArticlesSearchNavigationIcon);
  }

  Future<void> tapSettingNavigationIcon() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.settingNavigationIcon);
  }

  Future<void> tapBack() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.back);
  }
}
