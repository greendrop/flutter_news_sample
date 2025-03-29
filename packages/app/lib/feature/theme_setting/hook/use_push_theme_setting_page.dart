import 'package:app/feature/app_logger/hook/use_app_logger.dart';
import 'package:app/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef UsePushThemeSettingPageReturn = ({Future<void> Function() run});

typedef UsePushThemeSettingPage = UsePushThemeSettingPageReturn Function();

const String _hookName = 'usePushThemeSettingPage';

UsePushThemeSettingPageReturn usePushThemeSettingPageImpl() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    return ThemeSettingRouteData().push<void>(context);
  });

  return (run: run);
}

const UsePushThemeSettingPage usePushThemeSettingPage =
    usePushThemeSettingPageImpl;
