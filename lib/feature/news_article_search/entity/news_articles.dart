import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_articles.freezed.dart';

@freezed
class NewsArticles with _$NewsArticles {
  factory NewsArticles({
    @Default('') String keyword,
    @Default([]) List<NewsArticle> items,
    @Default(false) bool hasNextPage,
    @Default(1) int currentPage,
  }) = _NewsArticles;
  const NewsArticles._();
}
