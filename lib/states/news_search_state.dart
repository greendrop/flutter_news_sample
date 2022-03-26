// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/entities/news_article.dart';

part 'news_search_state.freezed.dart';

@freezed
class NewsSearchState with _$NewsSearchState {
  factory NewsSearchState({
    @Default('') String keyword,
    @Default(AsyncValue.data(<NewsArticle>[]))
        AsyncValue<List<NewsArticle>> articles,
  }) = _NewsSearchState;
  const NewsSearchState._();
}
