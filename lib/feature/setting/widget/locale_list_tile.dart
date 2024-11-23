import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/localization/hook/use_l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocaleListTile extends HookConsumerWidget {
  const LocaleListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();

    return ListTile(
      leading: const Icon(
        key: Key('LocaleListTileLeadingIcon'),
        FontAwesomeIcons.language,
      ),
      title: Text(
        key: const Key('LocaleListTileTitleText'),
        l10n.localeSettingTitle,
      ),
      onTap: onTap,
    );
  }
}
