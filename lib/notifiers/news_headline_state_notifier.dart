// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/entities/news_article.dart';
import 'package:flutter_news_sample/repositories/news_headline_repository.dart';
import 'package:flutter_news_sample/states/news_headline_state.dart';

class NewsHeadlineStateNotifier extends StateNotifier<NewsHeadlineState> {
  NewsHeadlineStateNotifier({NewsHeadlineRepository? newsHeadlineRepository})
      : super(NewsHeadlineState()) {
    this.newsHeadlineRepository =
        newsHeadlineRepository ?? NewsHeadlineRepository();
  }

  late final NewsHeadlineRepository newsHeadlineRepository;

  Future<void> fetchAllCategories() async {
    final appConfig = AppConfig();

    final categoryArticles = <String, List<NewsArticle>>{};
    final categoryArticlesFetching = <String, bool>{};
    for (final category in appConfig.newsHeadlineCategories) {
      categoryArticles[category] = [];
      categoryArticlesFetching[category] = true;
    }
    state = state.copyWith(
      categoryArticles: categoryArticles,
      categoryArticlesFetching: categoryArticlesFetching,
    );

    final futures = appConfig.newsHeadlineCategories
        .map((category) => newsHeadlineRepository.fetch(category: category));
    await Future.wait(futures).then((values) {
      values.asMap().forEach((index, articles) {
        categoryArticles[appConfig.newsHeadlineCategories[index]] = articles;
      });
    });
    await Future.wait(futures).then((values) {
      values.asMap().forEach((index, articles) {
        categoryArticles[appConfig.newsHeadlineCategories[index]] = articles;
      });
    });

    for (final category in appConfig.newsHeadlineCategories) {
      categoryArticlesFetching[category] = false;
    }
    state = state.copyWith(
      categoryArticles: categoryArticles,
      categoryArticlesFetching: categoryArticlesFetching,
    );
  }
}
