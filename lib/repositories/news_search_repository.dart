// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/entities/news_search_response.dart';
import 'package:flutter_news_sample/exceptions/app_exception.dart';
import 'package:flutter_news_sample/exceptions/app_http_exception.dart';

class NewsSearchRepository {
  final _baseUrl = 'https://newsapi.org/v2/everything';

  Future<NewsSearchResponse> fetch({
    required String keyword,
    int page = 1,
  }) async {
    final appConfig = AppConfig();
    final dio = Dio();
    final queryParameters = <String, dynamic>{
      'apiKey': appConfig.newsApiKey,
      'q': keyword,
      'pageSize': 100.toString(),
      'page': page.toString(),
    };

    try {
      final response =
          await dio.get<String>(_baseUrl, queryParameters: queryParameters);
      final decoded =
          json.decode(response.data.toString()) as Map<String, dynamic>;
      final newsSearchResponse = NewsSearchResponse.fromJson(decoded);
      return Future.value(newsSearchResponse);
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
