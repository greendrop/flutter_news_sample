import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_list/widget/news_article_list_page.dart';
import 'package:go_router/go_router.dart';

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
      appLogger.i(['$_hookName#call']);
      return context.goNamed(NewsArticleListPage.routeName);
    },
    [],
  );

  return (run: run,);
}
