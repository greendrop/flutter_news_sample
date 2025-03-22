import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DevToolListTile extends HookConsumerWidget {
  const DevToolListTile({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();

    return ListTile(
      leading: const Icon(
        key: Key('DevToolListTileLeadingIcon'),
        FontAwesomeIcons.toolbox,
      ),
      title: Text(
        key: const Key('DevToolListTileTitleText'),
        l10n.devToolsTitle,
      ),
      onTap: onTap,
    );
  }
}
