import 'package:flutter_news_sample/feature/news_api/dto/news_article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_top_headlines_response.freezed.dart';
part 'news_top_headlines_response.g.dart';

@freezed
class NewsTopHeadlinesResponse with _$NewsTopHeadlinesResponse {
  factory NewsTopHeadlinesResponse({
    String? status,
    int? totalResults,
    List<NewsArticle>? articles,
  }) = _NewsTopHeadlinesResponse;
  const NewsTopHeadlinesResponse._();

  factory NewsTopHeadlinesResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsTopHeadlinesResponseFromJson(json);
}
