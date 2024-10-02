import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';

typedef UsePushAppLogListPageReturn = ({
  Future<void> Function() run,
});

typedef UsePushAppLogListPage = UsePushAppLogListPageReturn Function();

const String _hookName = 'usePushAppLogListPage';

UsePushAppLogListPageReturn usePushAppLogListPageImpl() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    return AppLogListRouteData().push<void>(context);
  });

  return (run: run,);
}

final UsePushAppLogListPage usePushAppLogListPage = usePushAppLogListPageImpl;
