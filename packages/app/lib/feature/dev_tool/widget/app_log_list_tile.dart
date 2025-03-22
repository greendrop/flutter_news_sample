import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLogListTile extends HookConsumerWidget {
  const AppLogListTile({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();

    return ListTile(
      leading: const Icon(
        key: Key('AppLogListTileLeadingIcon'),
        FontAwesomeIcons.file,
      ),
      title: Text(
        key: const Key('AppLogListTileTitleText'),
        l10n.appLogListTitle,
      ),
      onTap: onTap,
    );
  }
}
