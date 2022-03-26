// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/entities/news_headline_response.dart';
import 'package:flutter_news_sample/exceptions/app_exception.dart';
import 'package:flutter_news_sample/exceptions/app_http_exception.dart';

class NewsHeadlineRepository {
  final _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<NewsHeadlineResponse> fetch({
    required String category,
    int page = 1,
  }) async {
    final appConfig = AppConfig();
    final dio = Dio();
    final queryParameters = <String, dynamic>{
      'apiKey': appConfig.newsApiKey,
      'country': 'jp',
      'category': category,
      'pageSize': 100.toString(),
      'page': page.toString(),
    };

    try {
      final response =
          await dio.get<String>(_baseUrl, queryParameters: queryParameters);
      final decoded =
          json.decode(response.data.toString()) as Map<String, dynamic>;
      final newsHeadlineResponse = NewsHeadlineResponse.fromJson(decoded);
      return Future.value(newsHeadlineResponse);
    } on DioError catch (error) {
      return Future.error(
        AppHttpException(
          statusCode: error.response?.statusCode,
          body: error.response?.data?.toString(),
          parentException: error,
        ),
      );
    } on Exception catch (error) {
      return Future.error(AppException(parentException: error));
    }
  }
}
