// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/exceptions/app_exception.dart';
import 'package:flutter_news_sample/repositories/news_headline_repository.dart';
import 'package:flutter_news_sample/states/news_headline_state.dart';

class NewsHeadlineStateNotifier extends StateNotifier<NewsHeadlineState> {
  NewsHeadlineStateNotifier({
    required this.ref,
    required this.category,
    NewsHeadlineRepository? newsHeadlineRepository,
  }) : super(NewsHeadlineState()) {
    this.newsHeadlineRepository =
        newsHeadlineRepository ?? NewsHeadlineRepository();
  }

  Ref ref;
  String category;
  late final NewsHeadlineRepository newsHeadlineRepository;

  Future<void> fetch() async {
    if (state.articles is AsyncLoading<void>) {
      return Future.value();
    }

    state = state.copyWith(articles: const AsyncValue.loading());

    try {
      final response = await newsHeadlineRepository.fetch(category: category);
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
