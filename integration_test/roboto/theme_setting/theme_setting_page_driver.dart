import 'package:flutter_test/flutter_test.dart';

import '../base_driver.dart';
import 'theme_setting_page_findable.dart';

class ThemeSettingPageDriver extends BaseDriver {
  ThemeSettingPageDriver(super.tester);

  final _findable = ThemeSettingPageFindable();

  bool get isShown => _findable.isShown;

  Future<void> waitUntileVisible() async {
    await waitFor(_findable.self);
  }

  Future<void> tapThemeModeSystemRadioListTile() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.themeModeSystemRadioListTile);
  }

  Future<void> tapThemeModeLightRadioListTile() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.themeModeLightRadioListTile);
  }

  Future<void> tapThemeModeDarkRadioListTile() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.themeModeDarkRadioListTile);
  }

  Future<void> tapBack() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.back);
  }
}
