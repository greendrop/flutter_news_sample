import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/app_log_detail_route_data_provider.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UsePushAppLogDetailPageReturn = ({
  Future<void> Function({required String filename}) run,
});

typedef UsePushAppLogDetailPage = UsePushAppLogDetailPageReturn Function();

const String _hookName = 'usePushAppLogDetailPage';

UsePushAppLogDetailPageReturn usePushAppLogDetailPage() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final run = useCallback(({required String filename}) {
    appLogger.i([
      '$_hookName#run',
      {'filename': filename},
    ]);
    return ref
        .read(appLogDetailRouteDataProvider(filename: filename))
        .push<void>(context);
  });

  return (run: run,);
}
