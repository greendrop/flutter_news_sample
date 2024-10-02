import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/design_token/color.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/theme_data/hook/use_theme_data.dart';

typedef UseShowDangerTextSnackBarReturn = ({
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Function({
    required String text,
  }) run,
});

typedef UseShowDangerTextSnackBar = UseShowDangerTextSnackBarReturn Function();

const String _hookName = 'useShowDangerTextSnackBar';

UseShowDangerTextSnackBarReturn useShowDangerTextSnackBarImpl() {
  final context = useContext();
  final appLogger = useAppLogger();
  final themeData = useThemeData();

  final run = useCallback(({required String text}) {
    appLogger.i(['$_hookName#run']);

    final snackBar = SnackBar(
      content: Text(
        text,
        style: (themeData.snackBarTheme.contentTextStyle ?? const TextStyle())
            .copyWith(
          color:
              DesignTokenColor.fromBrightness(themeData.brightness).dangerText,
        ),
      ),
      backgroundColor: DesignTokenColor.fromBrightness(themeData.brightness)
          .dangerBackground,
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });

  return (run: run,);
}

final UseShowDangerTextSnackBar useShowDangerTextSnackBar =
    useShowDangerTextSnackBarImpl;
