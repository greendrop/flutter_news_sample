import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_form.dart'
    as feature;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ThemeSettingForm extends StatelessWidget {
  const ThemeSettingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return feature.ThemeSettingForm(
      initialThemeMode: ThemeMode.system,
      onSubmit: (locale) {},
    );
  }
}

@UseCase(
  name: 'Default',
  type: ThemeSettingForm,
)
Widget buildThemeSettingFormDefaultUseCase(BuildContext context) {
  return const ThemeSettingForm();
}
