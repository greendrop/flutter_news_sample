import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_log_list/widget/app_log_list_page.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:go_router/go_router.dart';

typedef UsePushAppLogListPageReturn = ({
  Future<void> Function() run,
});

typedef UsePushAppLogListPage = UsePushAppLogListPageReturn Function();

const String _hookName = 'usePushAppLogListPage';

UsePushAppLogListPageReturn usePushAppLogListPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(() {
    appLogger.i(['$_hookName#run']);
    return context.pushNamed<void>(
      AppLogListPage.routeName,
    );
  });

  return (run: run,);
}
