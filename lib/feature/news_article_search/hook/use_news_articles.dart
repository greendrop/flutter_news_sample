import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_search/entity/news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_search/riverpod/news_articles_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseNewsArticlesReturn = ({
  AsyncValue<NewsArticles> state,
  Future<void> Function({required String keyword}) fetch,
  Future<void> Function() fetchMore,
});

typedef UseNewsArticles = UseNewsArticlesReturn Function({
  required String category,
});

const String _hookName = 'UseNewsArticles';

UseNewsArticlesReturn useNewsArticles() {
  final context = useContext();
  final ref = context as WidgetRef;

  final state = ref.watch(newsArticlesNotifierProvider);

  final fetch = useCallback(
    ({required String keyword}) {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#fetch',
          {'keyword': keyword},
        ],
      );
      return ref
          .read(
            newsArticlesNotifierProvider.notifier,
          )
          .fetch(keyword: keyword);
    },
    [],
  );

  final fetchMore = useCallback(
    () {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#fetchMore',
        ],
      );
      return ref
          .read(
            newsArticlesNotifierProvider.notifier,
          )
          .fetchMore();
    },
    [],
  );

  return (
    state: state,
    fetch: fetch,
    fetchMore: fetchMore,
  );
}
