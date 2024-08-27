import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/news_article_search_route_data.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseGoNewsArticleSearchPageReturn = ({
  void Function() run,
});

typedef UseGoNewsArticleSearchPage = UseGoNewsArticleSearchPageReturn
    Function();

const String _hookName = 'useGoNewshArticleSearchPage';

UseGoNewsArticleSearchPageReturn useGoNewsArticleSearchPage() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final run = useCallback(
    () {
      appLogger.i(['$_hookName#run']);
      return ref.read(newsArticleSearchRouteDataProvider).go(context);
    },
    [],
  );

  return (run: run,);
}
