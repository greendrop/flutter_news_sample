import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';

typedef UsePushAppLogDetailPageReturn = ({
  Future<void> Function({required String filename}) run,
});

typedef UsePushAppLogDetailPage = UsePushAppLogDetailPageReturn Function();

const String _hookName = 'usePushAppLogDetailPage';

UsePushAppLogDetailPageReturn usePushAppLogDetailPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(({required String filename}) {
    appLogger.i([
      '$_hookName#run',
      {'filename': filename},
    ]);
    return AppLogDetailRouteData(filename: filename).push<void>(context);
  });

  return (run: run,);
}
