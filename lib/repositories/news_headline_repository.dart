// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/exceptions/app_exception.dart';
import 'package:flutter_news_sample/exceptions/app_http_exception.dart';

class NewsHeadlineRepository {
  final _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<Response<String>> fetch({
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
      final responose =
          await dio.get<String>(_baseUrl, queryParameters: queryParameters);
      return Future.value(responose);
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
