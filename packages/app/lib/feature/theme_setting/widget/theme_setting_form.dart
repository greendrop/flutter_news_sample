import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ThemeSettingForm extends StatefulHookConsumerWidget {
  const ThemeSettingForm({
    required this.initialThemeMode,
    this.onSubmit,
    super.key,
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
    final l10n = useL10n();

    return ReactiveForm(
      formGroup: _formGroup,
      child: Column(
        children: [
          Column(
            key: const ValueKey('themeModeRadioListTiles'),
            children: [
              ReactiveRadioListTile<ThemeMode>(
                key: const ValueKey('themeModeSystemRadioListTile'),
                formControlName: 'themeMode',
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(FontAwesomeIcons.gear),
                title: Text(l10n.themeSettingSystem),
                value: ThemeMode.system,
                onChanged: (value) {
                  submit();
                },
              ),
              ReactiveRadioListTile<ThemeMode>(
                key: const ValueKey('themeModeLightRadioListTile'),
                formControlName: 'themeMode',
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(FontAwesomeIcons.sun),
                title: Text(l10n.themeSettingLight),
                value: ThemeMode.light,
                onChanged: (value) {
                  submit();
                },
              ),
              ReactiveRadioListTile<ThemeMode>(
                key: const ValueKey('themeModeDarkRadioListTile'),
                formControlName: 'themeMode',
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(FontAwesomeIcons.moon),
                title: Text(l10n.themeSettingDark),
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
    return FormGroup({
      'themeMode': FormControl<ThemeMode>(value: widget.initialThemeMode),
    });
  }
}
