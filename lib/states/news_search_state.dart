// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:flutter_news_sample/entities/news_article.dart';

part 'news_search_state.freezed.dart';

@freezed
class NewsSearchState with _$NewsSearchState {
  factory NewsSearchState({
    @Default(<NewsArticle>[]) List<NewsArticle> articles,
    @Default(false) bool fetching,
  }) = _NewsSearchState;
  const NewsSearchState._();
}
