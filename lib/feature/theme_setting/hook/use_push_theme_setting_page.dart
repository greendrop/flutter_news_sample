import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';

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
    return ThemeSettingRouteData().push<void>(context);
  });

  return (run: run,);
}
