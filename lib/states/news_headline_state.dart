// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:flutter_news_sample/entities/news_article.dart';

part 'news_headline_state.freezed.dart';

@freezed
class NewsHeadlineState with _$NewsHeadlineState {
  factory NewsHeadlineState({
    @Default(<NewsArticle>[]) List<NewsArticle> articles,
    @Default(false) bool fetching,
  }) = _NewsHeadlineState;
  const NewsHeadlineState._();
}
