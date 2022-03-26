// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:flutter_news_sample/entities/news_article.dart';

part 'news_headline_response.freezed.dart';
part 'news_headline_response.g.dart';

@freezed
class NewsHeadlineResponse with _$NewsHeadlineResponse {
  factory NewsHeadlineResponse({
    String? status,
    int? totalResults,
    List<NewsArticle>? articles,
  }) = _NewsHeadlineResponse;
  const NewsHeadlineResponse._();

  factory NewsHeadlineResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsHeadlineResponseFromJson(json);
}
