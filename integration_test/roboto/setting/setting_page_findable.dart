import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/widget/setting_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_findable.dart';

class SettingPageFindable extends BaseFindable<SettingPage> {
  SettingPageFindable();

  final localeListTile = find.byKey(const ValueKey('LocaleListTile'));

  final themeListTile = find.byKey(const ValueKey('ThemeListTile'));

  final appAboutListTile = find.byKey(const ValueKey('AppAboutListTile'));

  final back = find.byTooltip(RegExp(r'Back|戻る'));
}
