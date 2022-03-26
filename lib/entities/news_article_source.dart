// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article_source.freezed.dart';
part 'news_article_source.g.dart';

@freezed
class NewsArticleSource with _$NewsArticleSource {
  factory NewsArticleSource({
    String? id,
    String? name,
  }) = _NewsArticleSource;
  const NewsArticleSource._();

  factory NewsArticleSource.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleSourceFromJson(json);
}
