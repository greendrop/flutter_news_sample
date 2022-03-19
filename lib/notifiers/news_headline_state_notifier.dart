// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/entities/news_article.dart';
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
    state = state.copyWith(articles: [], fetching: true);
    return newsHeadlineRepository
        .fetch(category: category)
        .then<void>((response) {
      final articles = <NewsArticle>[];
      final decoded = json.decode(response.body) as Map<String, dynamic>;
      if (decoded.containsKey('articles')) {
        for (final Map<String, dynamic> item in decoded['articles']) {
          final newsArticle = NewsArticle.fromJson(<String, dynamic>{
            'title': item['title'],
            'url': item['url'],
            'imageUrl': item['urlToImage'],
          });
          articles.add(newsArticle);
        }
      }
      state = state.copyWith(articles: articles, fetching: false);
    });
  }
}
