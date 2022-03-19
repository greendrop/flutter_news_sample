// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article.freezed.dart';
part 'news_article.g.dart';

@freezed
class NewsArticle with _$NewsArticle {
  factory NewsArticle({
    String? title,
    String? url,
    String? imageUrl,
  }) = _NewsArticle;
  const NewsArticle._();

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);
}
