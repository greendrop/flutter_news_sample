import 'package:app/feature/setting/widget/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_findable.dart';

class SettingPageFindable extends BaseFindable<SettingPage> {
  SettingPageFindable();

  final localeListTile = find.byKey(const ValueKey('LocaleListTile'));

  final themeListTile = find.byKey(const ValueKey('ThemeListTile'));

  final appAboutListTile = find.byKey(const ValueKey('AppAboutListTile'));

  final newsArticlesNavigationIcon = find.byKey(
    const ValueKey('NewsArticlesNavigationIcon'),
  );

  final newsArticlesSearchNavigationIcon = find.byKey(
    const ValueKey('NewsArticlesSearchNavigationIcon'),
  );

  final settingNavigationIcon = find.byKey(
    const ValueKey('SettingNavigationIcon'),
  );

  final back = find.byTooltip(RegExp('Back|戻る'));
}
