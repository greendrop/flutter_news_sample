import 'package:app/feature/news_api/dto/news_article_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article.freezed.dart';
part 'news_article.g.dart';

@freezed
abstract class NewsArticle with _$NewsArticle {
  factory NewsArticle({
    NewsArticleSource? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) = _NewsArticle;
  const NewsArticle._();

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);
}
