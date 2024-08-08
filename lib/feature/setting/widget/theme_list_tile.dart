import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeListTile extends HookConsumerWidget {
  const ThemeListTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();

    return ListTile(
      leading: const Icon(
        key: Key('ThemeListTileLeadingIcon'),
        FontAwesomeIcons.circleHalfStroke,
      ),
      title: Text(
        key: const Key('ThemeListTileTitleText'),
        translations.themeSetting.title,
      ),
      onTap: onTap,
    );
  }
}
