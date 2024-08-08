import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_log_detail/widget/app_log_detail_page.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:go_router/go_router.dart';

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
    return context.pushNamed<void>(
      AppLogDetailPage.routeName,
      pathParameters: {'filename': filename},
    );
  });

  return (run: run,);
}
