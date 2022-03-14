// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article.freezed.dart';

@freezed
class NewsArticle with _$NewsArticle {
  factory NewsArticle({
    String? title,
    String? url,
    String? imageUrl,
  }) = _NewsArticle;
  const NewsArticle._();
}
