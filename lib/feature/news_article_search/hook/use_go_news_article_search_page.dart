import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_page.dart';
import 'package:go_router/go_router.dart';

typedef UseGoNewsArticleSearchPageReturn = ({
  void Function() run,
});

typedef UseGoNewsArticleSearchPage = UseGoNewsArticleSearchPageReturn
    Function();

const String _hookName = 'useGoNewshArticleSearchPage';

UseGoNewsArticleSearchPageReturn useGoNewsArticleSearchPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(
    () {
      appLogger.i(['$_hookName#run']);
      return context.goNamed(NewsArticleSearchPage.routeName);
    },
    [],
  );

  return (run: run,);
}
