import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_api/riverpod/news_top_headlines_repository.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article_list/entity/news_articles.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_articles_notifier.g.dart';

const String _notifierName = 'NewsArticlesNotifier';

@riverpod
class NewsArticlesNotifier extends _$NewsArticlesNotifier {
  @override
  FutureOr<NewsArticles> build({required String category}) {
    return NewsArticles();
  }

  Future<void> fetch() async {
    if (state.isLoading) {
      return Future.value();
    }

    final appLogger = ref.read(appLoggerProvider);
    state = const AsyncValue<NewsArticles>.loading().copyWithPrevious(state);

    try {
      final response = await ref
          .read(newsTopHeadlinesRepositoryProvider)
          .get(category: category);

      final responseArticles = (response.articles ?? []).map((responseArticle) {
        return NewsArticle.fromJson(responseArticle.toJson());
      }).toList();

      final hasNextPage = responseArticles.isNotEmpty;
      final newsArticles =
          NewsArticles(items: responseArticles, hasNextPage: hasNextPage);

      state =
          AsyncValue<NewsArticles>.data(newsArticles).copyWithPrevious(state);
      return Future.value();
    } on Exception catch (e) {
      appLogger.e(
        [
          '$_notifierName#fetch',
          {'category': category, 'Exception': e},
        ],
      );
      final appException =
          e is AppException ? e : AppException(parentException: e);
      state = AsyncValue<NewsArticles>.error(e, StackTrace.current)
          .copyWithPrevious(state);
      return Future.error(appException);
    }
  }

  Future<void> fetchMore() async {
    if (state.isLoading) {
      return Future.value();
    }

    final appLogger = ref.read(appLoggerProvider);
    state = const AsyncValue<NewsArticles>.loading().copyWithPrevious(state);

    try {
      final page = (state.valueOrNull?.currentPage ?? 0) + 1;
      final response = await ref
          .read(newsTopHeadlinesRepositoryProvider)
          .get(category: category, page: page);

      final responseArticles = (response.articles ?? []).map((responseArticle) {
        return NewsArticle.fromJson(responseArticle.toJson());
      }).toList();
      final hasNextPage = responseArticles.isNotEmpty;

      var newsArticles = state.valueOrNull;
      if (newsArticles == null) {
        newsArticles = NewsArticles(
          items: responseArticles,
          hasNextPage: hasNextPage,
          currentPage: page,
        );
      } else {
        newsArticles = newsArticles.copyWith(
          items: [...newsArticles.items, ...responseArticles],
          hasNextPage: hasNextPage,
          currentPage: hasNextPage ? page : newsArticles.currentPage,
        );
      }

      state =
          AsyncValue<NewsArticles>.data(newsArticles).copyWithPrevious(state);
      return Future.value();
    } on Exception catch (e) {
      appLogger.e(
        [
          '$_notifierName#fetchMore',
          {'category': category, 'Exception': e},
        ],
      );
      final appException =
          e is AppException ? e : AppException(parentException: e);
      state = AsyncValue<NewsArticles>.error(e, StackTrace.current)
          .copyWithPrevious(state);
      return Future.error(appException);
    }
  }
}
