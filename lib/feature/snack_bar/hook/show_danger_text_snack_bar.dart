import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/app_constant.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/theme_data/hook/use_theme_data.dart';

typedef UseShowDangerTextSnackBarReturn = ({
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Function({
    required String text,
  }) run,
});

typedef UseShowDangerTextSnackBar = UseShowDangerTextSnackBarReturn Function();

const String _hookName = 'useShowDangerTextSnackBar';

UseShowDangerTextSnackBarReturn useShowDangerTextSnackBar() {
  final context = useContext();
  final appLogger = useAppLogger();
  final themeData = useThemeData();

  final run = useCallback(({required String text}) {
    appLogger.i(['$_hookName#run']);

    final snackBar = SnackBar(
      content: Text(
        text,
        style: (themeData.snackBarTheme.contentTextStyle ?? const TextStyle())
            .copyWith(color: AppConstant.textColorDanger),
      ),
      backgroundColor: AppConstant.backgroundColorDanger,
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });

  return (run: run,);
}
