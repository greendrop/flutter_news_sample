import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/news_article_detail_route_data.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UsePushNewsArticleDetailPageReturn = ({
  Future<void> Function({required String title, required String url}) run,
});

typedef UsePushNewsArticleDetailPage = UsePushNewsArticleDetailPageReturn
    Function();

const String _hookName = 'usePushNewsArticleDetailPage';

UsePushNewsArticleDetailPageReturn usePushNewsArticleDetailPageImpl() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final run = useCallback(
    ({required String title, required String url}) {
      appLogger.i([
        '$_hookName#run',
        {'title': title, 'url': url},
      ]);
      return ref
          .read(newsArticleDetailRouteDataProvider(title: title, url: url))
          .push<void>(context);
    },
    [],
  );

  return (run: run,);
}

final UsePushNewsArticleDetailPage usePushNewsArticleDetailPage =
    usePushNewsArticleDetailPageImpl;
