import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_article_list/entity/news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_list/riverpod/news_articles_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseNewsArticlesReturn = ({
  AsyncValue<NewsArticles> state,
  Future<void> Function() fetch,
  Future<void> Function() fetchMore,
});

typedef UseNewsArticles = UseNewsArticlesReturn Function({
  required String category,
});

const String _hookName = 'UseNewsArticles';

UseNewsArticlesReturn useNewsArticles({
  required String category,
}) {
  final context = useContext();
  final ref = context as WidgetRef;

  final state = ref.watch(newsArticlesNotifierProvider(category: category));

  final fetch = useCallback(
    () {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#fetch',
          {'category': category},
        ],
      );
      return ref
          .read(
            newsArticlesNotifierProvider(category: category).notifier,
          )
          .fetch();
    },
    [category],
  );

  final fetchMore = useCallback(
    () {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#fetchMore',
          {'category': category},
        ],
      );
      return ref
          .read(
            newsArticlesNotifierProvider(category: category).notifier,
          )
          .fetchMore();
    },
    [category],
  );

  return (
    state: state,
    fetch: fetch,
    fetchMore: fetchMore,
  );
}
