import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/design_token/spacing.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/package_info/hook/use_package_info.dart';
import 'package:flutter_news_sample/feature/setting/widget/about_app_icon.dart';

typedef UseShowAppAboutDialogReturn = ({
  void Function() run,
});

typedef UseShowAppAboutDialog = UseShowAppAboutDialogReturn Function();

const String _hookName = 'useShowAppAboutDialog';

UseShowAppAboutDialogReturn useShowAppAboutDialogImpl() {
  final context = useContext();
  final appLogger = useAppLogger();
  final packageInfo = usePackageInfo();

  final run = useCallback(
    () {
      appLogger.i(['$_hookName#run']);
      if (packageInfo.state == null) {
        return;
      }

      return showAboutDialog(
        context: context,
        applicationName: packageInfo.state!.appName,
        applicationVersion: packageInfo.state!.version,
        applicationIcon: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: DesignTokenSpacing.sm),
            child: AboutAppIcon(),
          ),
        ),
      );
    },
    [packageInfo.state],
  );

  return (run: run,);
}

final UseShowAppAboutDialog useShowAppAboutDialog = useShowAppAboutDialogImpl;
