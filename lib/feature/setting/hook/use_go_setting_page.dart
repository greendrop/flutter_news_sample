import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';

typedef UseGoSettingPageReturn = ({
  void Function() run,
});

typedef UseGoSettingPage = UseGoSettingPageReturn Function();

const String _hookName = 'useGoSettingPage';

UseGoSettingPageReturn useGoSettingPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(
    () {
      appLogger.i(['$_hookName#run']);
      return SettingRouteData().go(context);
    },
    [],
  );

  return (run: run,);
}
