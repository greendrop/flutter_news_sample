import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_page.dart';
import 'package:go_router/go_router.dart';

typedef UsePushThemeSettingPageReturn = ({
  Future<void> Function() run,
});

typedef UsePushThemeSettingPage = UsePushThemeSettingPageReturn Function();

const String _hookName = 'usePushThemeSettingPage';

UsePushThemeSettingPageReturn usePushThemeSettingPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    return context.pushNamed<void>(
      ThemeSettingPage.routeName,
    );
  });

  return (run: run,);
}
