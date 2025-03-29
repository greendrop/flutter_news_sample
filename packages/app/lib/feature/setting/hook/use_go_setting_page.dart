import 'package:app/feature/app_logger/hook/use_app_logger.dart';
import 'package:app/feature/app_router/riverpod/setting_route_data.dart';
import 'package:app/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseGoSettingPageReturn = ({void Function() run});

typedef UseGoSettingPage = UseGoSettingPageReturn Function();

const String _hookName = 'useGoSettingPage';

UseGoSettingPageReturn useGoSettingPageImpl() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    return ref.read(settingRouteDataProvider).go(context);
  }, []);

  return (run: run);
}

const UseGoSettingPage useGoSettingPage = useGoSettingPageImpl;
