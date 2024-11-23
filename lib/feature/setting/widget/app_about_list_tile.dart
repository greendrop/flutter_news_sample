import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/localization/hook/use_l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppAboutListTile extends HookConsumerWidget {
  const AppAboutListTile({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();

    return ListTile(
      leading: const Icon(
        key: Key('AppAboutListTileLeadingIcon'),
        FontAwesomeIcons.info,
      ),
      title: Text(
        key: const Key('AppAboutListTileTitleText'),
        l10n.aboutAppTitle,
      ),
      onTap: onTap,
    );
  }
}
