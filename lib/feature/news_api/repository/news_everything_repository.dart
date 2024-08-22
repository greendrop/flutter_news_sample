import 'package:dio/dio.dart';
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/exception/app_exception.dart';
import 'package:flutter_news_sample/exception/app_http_exception.dart';
import 'package:flutter_news_sample/feature/news_api/client/news_everything_client.dart';
import 'package:flutter_news_sample/feature/news_api/dto/news_everything_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

const String _repositoryName = 'NewsEverythingRepository';

class NewsEverythingRepository {
  NewsEverythingRepository({required this.ref, required this.logger});

  final Ref ref;
  final Logger logger;

  Future<NewsEverythingResponse> get({
    required String query,
    int page = 1,
  }) async {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(logPrint: logger.d));
    final client = NewsEverythingClient(dio);
    try {
      final response = await client.get(
        apiKey: AppConfig.instance.newsApiKey,
        query: query,
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
