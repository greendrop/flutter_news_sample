import 'package:app/feature/theme_setting/widget/theme_setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_findable.dart';

class ThemeSettingPageFindable extends BaseFindable<ThemeSettingPage> {
  ThemeSettingPageFindable();

  final themeModeSystemRadioListTile = find.byKey(
    const ValueKey('themeModeSystemRadioListTile'),
  );

  final themeModeLightRadioListTile = find.byKey(
    const ValueKey('themeModeLightRadioListTile'),
  );

  final themeModeDarkRadioListTile = find.byKey(
    const ValueKey('themeModeDarkRadioListTile'),
  );

  final back = find.byTooltip(RegExp('Back|戻る'));
}
