// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:flutter_news_sample/entities/news_article.dart';

part 'news_search_response.freezed.dart';
part 'news_search_response.g.dart';

@freezed
class NewsSearchResponse with _$NewsSearchResponse {
  factory NewsSearchResponse({
    String? status,
    int? totalResults,
    List<NewsArticle>? articles,
  }) = _NewsSearchResponse;
  const NewsSearchResponse._();

  factory NewsSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsSearchResponseFromJson(json);
}
