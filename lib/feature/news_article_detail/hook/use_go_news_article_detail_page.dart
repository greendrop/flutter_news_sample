import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_detail/widget/news_article_detail_page.dart';
import 'package:go_router/go_router.dart';

typedef UseGoNewsArticleDetailPageReturn = ({
  void Function({required String title, required String url}) run,
});

typedef UseGoNewsArticleDetailPage = UseGoNewsArticleDetailPageReturn
    Function();

const String _hookName = 'useGoNewsArticleDetailPage';

UseGoNewsArticleDetailPageReturn useGoNewsArticleDetailPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(
    ({required String title, required String url}) {
      appLogger.i([
        '$_hookName#call',
        {'title': title, 'url': url},
      ]);
      return context.goNamed(
        NewsArticleDetailPage.routeName,
        queryParameters: {
          'title': title,
          'url': url,
        },
      );
    },
    [],
  );

  return (run: run,);
}
