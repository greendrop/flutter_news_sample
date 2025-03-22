import 'package:app/feature/app_logger/hook/use_app_logger.dart';
import 'package:app/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

const UsePushAppLogListPage usePushAppLogListPage = usePushAppLogListPageImpl;
