// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/entities/news_article.dart';

part 'news_headline_state.freezed.dart';

@freezed
class NewsHeadlineState with _$NewsHeadlineState {
  factory NewsHeadlineState({
    @Default(AsyncValue.data(<NewsArticle>[]))
        AsyncValue<List<NewsArticle>> articles,
  }) = _NewsHeadlineState;
  const NewsHeadlineState._();
}
