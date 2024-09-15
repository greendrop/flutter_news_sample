import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/design_token/color.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/theme_data/hook/use_theme_data.dart';

typedef UseShowInfoTextSnackBarReturn = ({
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Function({
    required String text,
  }) run,
});

typedef UseShowInfoTextSnackBar = UseShowInfoTextSnackBarReturn Function();

const String _hookName = 'useShowInfoTextSnackBar';

UseShowInfoTextSnackBarReturn useShowInfoTextSnackBar() {
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
          color: DesignTokenColor.fromBrightness(themeData.brightness).infoText,
        ),
      ),
      backgroundColor:
          DesignTokenColor.fromBrightness(themeData.brightness).infoBackground,
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });

  return (run: run,);
}
