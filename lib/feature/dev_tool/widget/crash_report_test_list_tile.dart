import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CrashReportListTile extends HookConsumerWidget {
  const CrashReportListTile({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();

    return ListTile(
      leading: const Icon(
        key: Key('CrashReportListTileLeadingIcon'),
        FontAwesomeIcons.burst,
      ),
      title: Text(
        key: const Key('CrashReportListTileTitleText'),
        translations.devTools.crashReportTest,
      ),
      onTap: onTap,
    );
  }
}
