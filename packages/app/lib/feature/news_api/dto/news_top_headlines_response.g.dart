// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_top_headlines_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsTopHeadlinesResponse _$NewsTopHeadlinesResponseFromJson(
  Map<String, dynamic> json,
) => _NewsTopHeadlinesResponse(
  status: json['status'] as String?,
  totalResults: (json['totalResults'] as num?)?.toInt(),
  articles:
      (json['articles'] as List<dynamic>?)
          ?.map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$NewsTopHeadlinesResponseToJson(
  _NewsTopHeadlinesResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'totalResults': instance.totalResults,
  'articles': instance.articles?.map((e) => e.toJson()).toList(),
};
