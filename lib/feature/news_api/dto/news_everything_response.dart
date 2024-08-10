import 'package:flutter_news_sample/feature/news_api/dto/news_article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_everything_response.freezed.dart';
part 'news_everything_response.g.dart';

@freezed
class NewsEvrythingResponse with _$NewsEvrythingResponse {
  factory NewsEvrythingResponse({
    String? status,
    int? totalResults,
    List<NewsArticle>? articles,
  }) = _NewsEvrythingResponse;
  const NewsEvrythingResponse._();

  factory NewsEvrythingResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsEvrythingResponseFromJson(json);
}
