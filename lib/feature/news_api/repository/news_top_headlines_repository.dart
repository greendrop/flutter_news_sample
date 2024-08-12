import 'package:dio/dio.dart';
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/exception/app_http_exception.dart';
import 'package:flutter_news_sample/feature/news_api/client/news_top_headlines_client.dart';
import 'package:flutter_news_sample/feature/news_api/dto/news_top_headlines_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsTopHeadlinesRepository {
  NewsTopHeadlinesRepository({required this.ref});

  final Ref ref;

  Future<NewsTopHeadlinesResponse> get({
    required String category,
    int page = 1,
  }) async {
    final dio = Dio();
    final client = NewsTopHeadlinesClient(dio);
    try {
      final response = client.get(
        apiKey: AppConfig.instance.newsApiKey,
        country: 'jp',
        category: category,
        pageSize: 100,
        page: page,
      );

      return Future.value(response);
    } on DioException catch (error) {
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
