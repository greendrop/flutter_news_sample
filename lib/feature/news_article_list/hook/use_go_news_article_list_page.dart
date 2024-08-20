import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';

typedef UseGoNewsArticleListPageReturn = ({
  void Function() run,
});

typedef UseGoNewsArticleListPage = UseGoNewsArticleListPageReturn Function();

const String _hookName = 'useGoNewsArticleListPage';

UseGoNewsArticleListPageReturn useGoNewsArticleListPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(
    () {
      appLogger.i(['$_hookName#run']);
      return NewsArticleListRouteData().go(context);
    },
    [],
  );

  return (run: run,);
}
