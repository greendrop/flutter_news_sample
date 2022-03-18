// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/entities/news_article.dart';
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

  Future<void> fetch({required String keyword}) {
    state = state.copyWith(articles: [], fetching: true);

    return newsSearchRepository.fetch(keyword: keyword).then<void>((response) {
      final articles = <NewsArticle>[];
      final decoded = json.decode(response.body) as Map<String, dynamic>;
      if (decoded.containsKey('articles')) {
        for (final Map<String, dynamic> item in decoded['articles']) {
          final newsArticle = NewsArticle(
            title: item.containsKey('title') && item['title'] != null
                ? item['title'].toString()
                : null,
            url: item.containsKey('url') && item['url'] != null
                ? item['url'].toString()
                : null,
            imageUrl:
                item.containsKey('urlToImage') && item['urlToImage'] != null
                    ? item['urlToImage'].toString()
                    : null,
          );
          articles.add(newsArticle);
        }
      }
      state = state.copyWith(articles: articles, fetching: false);
    });
  }
}
