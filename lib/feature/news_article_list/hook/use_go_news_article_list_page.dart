import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_news_sample/feature/news_article_list/enum/news_headline_category.dart';

typedef UseGoNewsArticleListPageReturn = ({
  void Function({
    NewsHeadlineCategory category,
  }) run,
});

typedef UseGoNewsArticleListPage = UseGoNewsArticleListPageReturn Function();

const String _hookName = 'useGoNewsArticleListPage';

UseGoNewsArticleListPageReturn useGoNewsArticleListPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(
    ({NewsHeadlineCategory? category}) {
      appLogger.i([
        '$_hookName#run',
        {'category': category},
      ]);
      return NewsArticleListRouteData(category: category?.value).go(context);
    },
    [],
  );

  return (run: run,);
}
