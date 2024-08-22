import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/locale_setting_route_data_provider.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UsePushLocaleSettingPageReturn = ({
  Future<void> Function() run,
});

typedef UsePushLocaleSettingPage = UsePushLocaleSettingPageReturn Function();

const String _hookName = 'usePushLocaleSettingPage';

UsePushLocaleSettingPageReturn usePushLocaleSettingPage() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    return ref.read(localeSettingRouteDataProvider).push<void>(context);
  });

  return (run: run,);
}
