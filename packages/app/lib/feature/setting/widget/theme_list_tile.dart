import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeListTile extends HookConsumerWidget {
  const ThemeListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();

    return ListTile(
      leading: const Icon(
        key: Key('ThemeListTileLeadingIcon'),
        FontAwesomeIcons.circleHalfStroke,
      ),
      title: Text(
        key: const Key('ThemeListTileTitleText'),
        l10n.themeSettingTitle,
      ),
      onTap: onTap,
    );
  }
}
