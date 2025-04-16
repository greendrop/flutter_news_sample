import 'package:app/feature/locale_setting/hook/use_locale.dart';
import 'package:app/feature/locale_setting/widget/locale_setting_page.dart'
    as feature;
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class LocaleSettingPage extends StatelessWidget {
  const LocaleSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    UseLocaleReturn useLocale() {
      const state = null;
      Future<void> initialize() async {}
      Future<void> update(Locale? locale) async {}

      return (state: state, initialize: initialize, update: update);
    }

    return feature.LocaleSettingPage(useLocale: useLocale);
  }
}

Widget buildLocaleSettingPageDefault(BuildContext context) {
  return const LocaleSettingPage();
}

@UseCase(name: 'Default', type: LocaleSettingPage)
Widget buildLocaleSettingPageDefaultUseCase(BuildContext context) {
  return buildLocaleSettingPageDefault(context);
}
