// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_headline_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsHeadlineResponse _$$_NewsHeadlineResponseFromJson(
        Map<String, dynamic> json) =>
    _$_NewsHeadlineResponse(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NewsHeadlineResponseToJson(
        _$_NewsHeadlineResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
