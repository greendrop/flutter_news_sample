import 'package:app/feature/locale_setting/widget/locale_setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_findable.dart';

class LocaleSettingPageFindable extends BaseFindable<LocaleSettingPage> {
  LocaleSettingPageFindable();

  final localeSystemRadioListTile = find.byKey(
    const ValueKey('localeSystemRadioListTile'),
  );

  final localeEnRadioListTile = find.byKey(
    const ValueKey('localeEnRadioListTile'),
  );

  final localeJaRadioListTile = find.byKey(
    const ValueKey('localeJaRadioListTile'),
  );

  final back = find.byTooltip(RegExp('Back|戻る'));
}
