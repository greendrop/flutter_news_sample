import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/design_token/spacing.dart';
import 'package:flutter_news_sample/feature/package_info/hook/use_package_info.dart'
    as hook;
import 'package:flutter_news_sample/feature/setting/widget/about_app_icon.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingAboutListTile extends HookConsumerWidget {
  const SettingAboutListTile({
    super.key,
    this.usePackageInfo = hook.usePackageInfo,
  });

  final hook.UsePackageInfo usePackageInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    final packageInfo = usePackageInfo();

    return packageInfo.state.maybeWhen(
      data: (packageInfo) {
        return AboutListTile(
          icon: const Icon(FontAwesomeIcons.info),
          applicationName: packageInfo.appName,
          applicationIcon: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: DesignTokenSpacing.sm),
              child: AboutAppIcon(),
            ),
          ),
          applicationVersion: packageInfo.version,
          child: Text(translations.aboutApp.title),
        );
      },
      orElse: Container.new,
    );
  }
}
