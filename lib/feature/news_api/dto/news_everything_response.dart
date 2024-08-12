import 'package:flutter_news_sample/feature/news_api/dto/news_article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_everything_response.freezed.dart';
part 'news_everything_response.g.dart';

@freezed
class NewsEverythingResponse with _$NewsEverythingResponse {
  factory NewsEverythingResponse({
    String? status,
    int? totalResults,
    List<NewsArticle>? articles,
  }) = _NewsEverythingResponse;
  const NewsEverythingResponse._();

  factory NewsEverythingResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsEverythingResponseFromJson(json);
}
