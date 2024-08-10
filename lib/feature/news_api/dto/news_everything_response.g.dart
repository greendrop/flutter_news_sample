// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_everything_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsEvrythingResponseImpl _$$NewsEvrythingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsEvrythingResponseImpl(
      status: json['status'] as String?,
      totalResults: (json['totalResults'] as num?)?.toInt(),
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewsEvrythingResponseImplToJson(
        _$NewsEvrythingResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles?.map((e) => e.toJson()).toList(),
    };
