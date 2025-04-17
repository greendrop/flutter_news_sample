import 'package:app/feature/theme_setting/widget/theme_setting_form.dart'
    as feature;
import 'package:flutter/material.dart';
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

Widget buildThemeSettingFormDefault(BuildContext context) {
  return const ThemeSettingForm();
}

@UseCase(name: 'Default', type: ThemeSettingForm)
Widget buildThemeSettingFormDefaultUseCase(BuildContext context) {
  return buildThemeSettingFormDefault(context);
}
