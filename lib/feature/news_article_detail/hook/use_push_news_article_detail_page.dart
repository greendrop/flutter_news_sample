import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';

typedef UsePushNewsArticleDetailPageReturn = ({
  void Function({required String title, required String url}) run,
});

typedef UsePushNewsArticleDetailPage = UsePushNewsArticleDetailPageReturn
    Function();

const String _hookName = 'usePushNewsArticleDetailPage';

UsePushNewsArticleDetailPageReturn usePushNewsArticleDetailPage() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(
    ({required String title, required String url}) {
      appLogger.i([
        '$_hookName#run',
        {'title': title, 'url': url},
      ]);
      return NewsArticleDetailRouteData(title: title, url: url)
          .push<void>(context);
    },
    [],
  );

  return (run: run,);
}
