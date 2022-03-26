// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/exceptions/app_exception.dart';
import 'package:flutter_news_sample/repositories/news_search_repository.dart';
import 'package:flutter_news_sample/states/news_search_state.dart';

class NewsSearchStateNotifier extends StateNotifier<NewsSearchState> {
  NewsSearchStateNotifier({
    required this.ref,
    NewsSearchRepository? newsSearchRepository,
  }) : super(NewsSearchState()) {
    this.newsSearchRepository = newsSearchRepository ?? NewsSearchRepository();
  }

  Ref ref;
  late final NewsSearchRepository newsSearchRepository;

  Future<void> fetch({required String keyword}) async {
    if (state.articles is AsyncLoading<void>) {
      return Future.value();
    }

    state =
        state.copyWith(keyword: keyword, articles: const AsyncValue.loading());

    try {
      final response = await newsSearchRepository.fetch(keyword: keyword);
      state = state.copyWith(
        articles: AsyncValue.data(response.articles ?? []),
      );
      return Future.value();
    } on Exception catch (error) {
      final appException =
          error is AppException ? error : AppException(parentException: error);
      state = state.copyWith(articles: AsyncValue.error(appException));
      return Future.error(appException);
    }
  }
}
