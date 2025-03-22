import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LocaleSettingForm extends StatefulHookConsumerWidget {
  const LocaleSettingForm({
    super.key,
    required this.initialLocale,
    this.onSubmit,
  });

  final Locale? initialLocale;
  final void Function(Locale? locale)? onSubmit;

  @override
  LocaleSettingFormState createState() => LocaleSettingFormState();
}

class LocaleSettingFormState extends ConsumerState<LocaleSettingForm> {
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
            key: const Key('localeRadioListTiles'),
            children: [
              ReactiveRadioListTile<Locale?>(
                key: const Key('localeSystemRadioListTile'),
                formControlName: 'locale',
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(l10n.localeSettingSystem),
                value: null,
                onChanged: (formControl) {
                  submit();
                },
              ),
              ReactiveRadioListTile<Locale?>(
                key: const Key('localeEnRadioListTile'),
                formControlName: 'locale',
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(l10n.localeSettingEnglish),
                value: const Locale('en'),
                onChanged: (formControl) {
                  submit();
                },
              ),
              ReactiveRadioListTile<Locale?>(
                key: const Key('localeJaRadioListTile'),
                formControlName: 'locale',
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(l10n.localeSettingJapanese),
                value: const Locale('ja'),
                onChanged: (formControl) {
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
      _formGroup.control('locale').value as Locale?,
    );
  }

  FormGroup _buildFromGroup(BuildContext context) {
    return FormGroup(
      {
        'locale': FormControl<Locale?>(
          value: widget.initialLocale,
        ),
      },
    );
  }
}
