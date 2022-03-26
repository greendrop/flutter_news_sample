// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsSearchResponse _$$_NewsSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_NewsSearchResponse(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NewsSearchResponseToJson(
        _$_NewsSearchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
