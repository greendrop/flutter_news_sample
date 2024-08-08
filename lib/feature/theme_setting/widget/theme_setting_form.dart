import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ThemeSettingForm extends StatefulHookConsumerWidget {
  const ThemeSettingForm({
    super.key,
    required this.initialThemeMode,
    this.onSubmit,
  });

  final ThemeMode initialThemeMode;
  final void Function(ThemeMode)? onSubmit;

  @override
  ThemeSettingFormState createState() => ThemeSettingFormState();
}

class ThemeSettingFormState extends ConsumerState<ThemeSettingForm> {
  late FormGroup _formGroup;

  @override
  void initState() {
    super.initState();

    _formGroup = _buildFromGroup(context);
  }

  @override
  Widget build(BuildContext context) {
    final translations = useTranslations();

    return ReactiveForm(
      formGroup: _formGroup,
      child: Column(
        children: [
          Column(
            key: const Key('themeModeRadioListTiles'),
            children: [
              ReactiveRadioListTile<ThemeMode>(
                key: const Key('themeModeSystemRadioListTile'),
                formControlName: 'themeMode',
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(FontAwesomeIcons.gear),
                title: Text(translations.themeSetting.system),
                value: ThemeMode.system,
                onChanged: (value) {
                  submit();
                },
              ),
              ReactiveRadioListTile<ThemeMode>(
                key: const Key('themeModeLightRadioListTile'),
                formControlName: 'themeMode',
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(FontAwesomeIcons.sun),
                title: Text(translations.themeSetting.light),
                value: ThemeMode.light,
                onChanged: (value) {
                  submit();
                },
              ),
              ReactiveRadioListTile<ThemeMode>(
                key: const Key('themeModeDarkRadioListTile'),
                formControlName: 'themeMode',
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(FontAwesomeIcons.moon),
                title: Text(translations.themeSetting.dark),
                value: ThemeMode.dark,
                onChanged: (value) {
                  submit();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void submit() {
    _formGroup.markAllAsTouched();

    if (_formGroup.invalid) {
      return;
    }

    widget.onSubmit?.call(
      _formGroup.control('themeMode').value as ThemeMode? ?? ThemeMode.system,
    );
  }

  FormGroup _buildFromGroup(BuildContext context) {
    return FormGroup(
      {
        'themeMode': FormControl<ThemeMode>(
          value: widget.initialThemeMode,
        ),
      },
    );
  }
}
