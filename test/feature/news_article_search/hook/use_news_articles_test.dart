import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/news_api/dto/news_article.dart'
    as dto;
import 'package:flutter_news_sample/feature/news_api/dto/news_article_source.dart'
    as dto;
import 'package:flutter_news_sample/feature/news_api/dto/news_everything_response.dart';
import 'package:flutter_news_sample/feature/news_api/repository/news_everything_repository.dart';
import 'package:flutter_news_sample/feature/news_api/riverpod/news_everything_repository.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart'
    as entity;
import 'package:flutter_news_sample/feature/news_article/entity/news_article_source.dart'
    as entity;
import 'package:flutter_news_sample/feature/news_article_search/entity/news_articles.dart'
    as entity;
import 'package:flutter_news_sample/feature/news_article_search/hook/use_news_articles.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/logger.dart';
import '../../../support/widget/test_material_app.dart';

class MockNewsEverythingRepository extends Mock
    implements NewsEverythingRepository {}

void main() {
  group('UseNewsArticles', () {
    group('#fetch', () {
      group("引数 keyword: 'keyword'", () {
        testWidgets(
            [
              'NewsEverythingRepository#getが呼ばれること',
              'NewsArticlesのstateに設定されること',
            ].join(', '), (tester) async {
          late UseNewsArticlesReturn newsArticles;

          final newsEverythingRepository = MockNewsEverythingRepository();

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                appLoggerProvider.overrideWithValue(buildAppTestLogger()),
                newsEverythingRepositoryProvider
                    .overrideWithValue(newsEverythingRepository),
              ],
              child: TestMaterialApp(
                child: HookConsumer(
                  builder: (context, ref, child) {
                    newsArticles = useNewsArticles();
                    return Container();
                  },
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();

          final newsEverythingResponse = NewsEverythingResponse(
            status: 'ok',
            totalResults: 3,
            articles: [
              dto.NewsArticle(
                source: dto.NewsArticleSource(id: 'id', name: 'name'),
                title: 'title1',
                description: 'description',
                url: 'https://example.com',
              ),
              dto.NewsArticle(
                source: dto.NewsArticleSource(id: 'id', name: 'name'),
                title: 'title2',
                description: 'description',
                url: 'https://example.com',
              ),
              dto.NewsArticle(
                source: dto.NewsArticleSource(id: 'id', name: 'name'),
                title: 'title3',
                description: 'description',
                url: 'https://example.com',
              ),
            ],
          );

          when(() => newsEverythingRepository.get(query: 'keyword'))
              .thenAnswer((_) async => newsEverythingResponse);

          await newsArticles.fetch(keyword: 'keyword');
          await tester.pumpAndSettle();

          verify(() => newsEverythingRepository.get(query: 'keyword'))
              .called(1);
          expect(newsArticles.state.hasValue, isTrue);
          expect(newsArticles.state.hasError, isFalse);
          expect(newsArticles.state.isLoading, isFalse);
          expect(
            newsArticles.state.valueOrNull,
            entity.NewsArticles(
              keyword: 'keyword',
              items: [
                entity.NewsArticle(
                  source: entity.NewsArticleSource(id: 'id', name: 'name'),
                  title: 'title1',
                  description: 'description',
                  url: 'https://example.com',
                ),
                entity.NewsArticle(
                  source: entity.NewsArticleSource(id: 'id', name: 'name'),
                  title: 'title2',
                  description: 'description',
                  url: 'https://example.com',
                ),
                entity.NewsArticle(
                  source: entity.NewsArticleSource(id: 'id', name: 'name'),
                  title: 'title3',
                  description: 'description',
                  url: 'https://example.com',
                ),
              ],
              hasNextPage: true,
            ),
          );
        });
      });
      group("引数 keyword: 'keyword, isRefresh: true'", () {
        testWidgets(
            [
              'NewsEverythingRepository#getが呼ばれること',
              'NewsArticlesのstateに設定されること',
            ].join(', '), (tester) async {
          late UseNewsArticlesReturn newsArticles;

          final newsEverythingRepository = MockNewsEverythingRepository();

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                appLoggerProvider.overrideWithValue(buildAppTestLogger()),
                newsEverythingRepositoryProvider
                    .overrideWithValue(newsEverythingRepository),
              ],
              child: TestMaterialApp(
                child: HookConsumer(
                  builder: (context, ref, child) {
                    newsArticles = useNewsArticles();
                    return Container();
                  },
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();

          final newsEverythingResponse = NewsEverythingResponse(
            status: 'ok',
            totalResults: 3,
            articles: [
              dto.NewsArticle(
                source: dto.NewsArticleSource(id: 'id', name: 'name'),
                title: 'title1',
                description: 'description',
                url: 'https://example.com',
              ),
              dto.NewsArticle(
                source: dto.NewsArticleSource(id: 'id', name: 'name'),
                title: 'title2',
                description: 'description',
                url: 'https://example.com',
              ),
              dto.NewsArticle(
                source: dto.NewsArticleSource(id: 'id', name: 'name'),
                title: 'title3',
                description: 'description',
                url: 'https://example.com',
              ),
            ],
          );

          when(() => newsEverythingRepository.get(query: 'keyword'))
              .thenAnswer((_) async => newsEverythingResponse);

          await newsArticles.fetch(keyword: 'keyword', isRefresh: true);
          await tester.pumpAndSettle();

          verify(() => newsEverythingRepository.get(query: 'keyword'))
              .called(1);
          expect(newsArticles.state.hasValue, isTrue);
          expect(newsArticles.state.hasError, isFalse);
          expect(newsArticles.state.isLoading, isFalse);
          expect(
            newsArticles.state.valueOrNull,
            entity.NewsArticles(
              keyword: 'keyword',
              items: [
                entity.NewsArticle(
                  source: entity.NewsArticleSource(id: 'id', name: 'name'),
                  title: 'title1',
                  description: 'description',
                  url: 'https://example.com',
                ),
                entity.NewsArticle(
                  source: entity.NewsArticleSource(id: 'id', name: 'name'),
                  title: 'title2',
                  description: 'description',
                  url: 'https://example.com',
                ),
                entity.NewsArticle(
                  source: entity.NewsArticleSource(id: 'id', name: 'name'),
                  title: 'title3',
                  description: 'description',
                  url: 'https://example.com',
                ),
              ],
              hasNextPage: true,
            ),
          );
        });
      });
    });
  });
}
