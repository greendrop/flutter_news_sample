// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsArticleImpl _$$NewsArticleImplFromJson(Map<String, dynamic> json) =>
    _$NewsArticleImpl(
      source: json['source'] == null
          ? null
          : NewsArticleSource.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$NewsArticleImplToJson(_$NewsArticleImpl instance) =>
    <String, dynamic>{
      'source': instance.source?.toJson(),
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'content': instance.content,
    };
