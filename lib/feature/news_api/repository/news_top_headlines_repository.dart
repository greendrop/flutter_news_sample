import 'package:dio/dio.dart';
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/exception/app_http_exception.dart';
import 'package:flutter_news_sample/feature/news_api/client/news_top_headlines_client.dart';
import 'package:flutter_news_sample/feature/news_api/dto/news_top_headlines_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

const String _repositoryName = 'NewsTopHeadlinesRepository';

class NewsTopHeadlinesRepository {
  NewsTopHeadlinesRepository({
    required this.ref,
    required this.logger,
    required this.dio,
  });

  final Ref ref;
  final Logger logger;
  final Dio dio;

  Future<NewsTopHeadlinesResponse> get({
    required String category,
    int page = 1,
  }) async {
    dio.interceptors.add(LogInterceptor(logPrint: logger.d));
    final client = NewsTopHeadlinesClient(dio);
    try {
      final response = await client.get(
        apiKey: AppConfig.instance.newsApiKey,
        category: category,
        pageSize: 100,
        page: page,
      );

      return Future.value(response);
    } on DioException catch (error) {
      logger.e([
        '$_repositoryName#get',
        {'DioException', error},
      ]);
      return Future.error(
        AppHttpException(
          statusCode: error.response?.statusCode,
          body: error.response?.data?.toString(),
          parentException: error,
        ),
      );
    } on Exception catch (error) {
      logger.e([
        '$_repositoryName#get',
        {'Exception', error},
      ]);
      return Future.error(AppException(parentException: error));
    }
  }
}
