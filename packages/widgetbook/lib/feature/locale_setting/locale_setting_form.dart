import 'package:app/feature/locale_setting/widget/locale_setting_form.dart'
    as feature;
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class LocaleSettingForm extends StatelessWidget {
  const LocaleSettingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return feature.LocaleSettingForm(
      initialLocale: null,
      onSubmit: (locale) {},
    );
  }
}

Widget buildLocaleSettingFormDefault(BuildContext context) {
  return const LocaleSettingForm();
}

@UseCase(name: 'Default', type: LocaleSettingForm)
Widget buildLocaleSettingFormDefaultUseCase(BuildContext context) {
  return buildLocaleSettingFormDefault(context);
}
