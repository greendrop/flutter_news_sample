import 'package:dio/dio.dart';
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/exception/app_http_exception.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_api/dto/news_article.dart';
import 'package:flutter_news_sample/feature/news_api/dto/news_article_source.dart';
import 'package:flutter_news_sample/feature/news_api/riverpod/news_api_dio.dart';
import 'package:flutter_news_sample/feature/news_api/riverpod/news_top_headlines_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../support/logger.dart';

void main() {
  group('NewsTopHeadlinesRepository', () {
    group('#get', () {
      group("引数 category: 'general'", () {
        group('200 OK', () {
          test('ニュース記事が取得できること', () async {
            final dio = Dio();
            DioAdapter(dio: dio).onGet(
              '',
              (server) => server.reply(200, {
                'status': 'ok',
                'totalResults': 2,
                'articles': [
                  {
                    'source': {'id': 'id', 'name': 'name'},
                    'title': 'title1',
                    'url': 'https://example.com',
                  },
                  {
                    'source': {'id': 'id', 'name': 'name'},
                    'title': 'title2',
                    'url': 'https://example.com',
                  },
                ],
              }),
              queryParameters: {
                'apiKey': AppConfig.instance.newsApiKey,
                'category': 'general',
                'pageSize': 100,
                'page': 1,
              },
            );

            final container = ProviderContainer(
              overrides: [
                appLoggerProvider.overrideWithValue(buildAppTestLogger()),
                newsApiDioProvider.overrideWithValue(dio),
              ],
            );

            final repository =
                container.read(newsTopHeadlinesRepositoryProvider);

            final response = await repository.get(category: 'general');
            expect(response.articles, [
              NewsArticle(
                source: NewsArticleSource(id: 'id', name: 'name'),
                title: 'title1',
                url: 'https://example.com',
              ),
              NewsArticle(
                source: NewsArticleSource(id: 'id', name: 'name'),
                title: 'title2',
                url: 'https://example.com',
              ),
            ]);
          });
        });

        group('401 Unauthorized', () {
          test('AppHttpExceptionが発生すること', () async {
            final dio = Dio();
            DioAdapter(dio: dio).onGet(
              '',
              (server) => server.reply(401, 'Unauthorized'),
              queryParameters: {
                'apiKey': AppConfig.instance.newsApiKey,
                'category': 'general',
                'pageSize': 100,
                'page': 1,
              },
            );

            final container = ProviderContainer(
              overrides: [
                appLoggerProvider.overrideWithValue(buildAppTestLogger()),
                newsApiDioProvider.overrideWithValue(dio),
              ],
            );

            final repository =
                container.read(newsTopHeadlinesRepositoryProvider);

            expect(
              () async => repository.get(category: 'general'),
              throwsA(
                isA<AppHttpException>().having(
                  (e) => e.statusCode,
                  'statusCode',
                  401,
                ),
              ),
            );
          });
        });
      });

      group("引数 category: 'general', page: 2", () {
        group('200 OK', () {
          test('ニュース記事が取得できること', () async {
            final dio = Dio();
            DioAdapter(dio: dio).onGet(
              '',
              (server) => server.reply(200, {
                'status': 'ok',
                'totalResults': 4,
                'articles': [
                  {
                    'source': {'id': 'id', 'name': 'name'},
                    'title': 'title3',
                    'url': 'https://example.com',
                  },
                  {
                    'source': {'id': 'id', 'name': 'name'},
                    'title': 'title4',
                    'url': 'https://example.com',
                  },
                ],
              }),
              queryParameters: {
                'apiKey': AppConfig.instance.newsApiKey,
                'category': 'general',
                'pageSize': 100,
                'page': 2,
              },
            );

            final container = ProviderContainer(
              overrides: [
                appLoggerProvider.overrideWithValue(buildAppTestLogger()),
                newsApiDioProvider.overrideWithValue(dio),
              ],
            );

            final repository =
                container.read(newsTopHeadlinesRepositoryProvider);

            final response = await repository.get(category: 'general', page: 2);
            expect(response.articles, [
              NewsArticle(
                source: NewsArticleSource(id: 'id', name: 'name'),
                title: 'title3',
                url: 'https://example.com',
              ),
              NewsArticle(
                source: NewsArticleSource(id: 'id', name: 'name'),
                title: 'title4',
                url: 'https://example.com',
              ),
            ]);
          });
        });
      });
    });
  });
}
