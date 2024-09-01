import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_api/dto/news_article.dart'
    as dto;
import 'package:flutter_news_sample/feature/news_api/dto/news_article_source.dart'
    as dto;
import 'package:flutter_news_sample/feature/news_api/dto/news_top_headlines_response.dart';
import 'package:flutter_news_sample/feature/news_api/repository/news_top_headlines_repository.dart';
import 'package:flutter_news_sample/feature/news_api/riverpod/news_top_headlines_repository.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart'
    as entity;
import 'package:flutter_news_sample/feature/news_article/entity/news_article_source.dart'
    as entity;
import 'package:flutter_news_sample/feature/news_article_list/hook/use_news_articles.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget/test_material_app.dart';

class MockNewsTopHeadlinesRepository extends Mock
    implements NewsTopHeadlinesRepository {}

void main() {
  group('UseNewsArticles', () {
    group('#fetch, #fetchMore', () {
      group('newsTopHeadlinesRepository#getが正常', () {
        testWidgets(
            [
              'fetchを実行しRepository#getのレスポンス3件の場合、state.itemsに設定されること',
              'fetchMoreを実行しRepositoryのレスポンスが3件の場合、state.itemsに追加されること',
              // ignore: lines_longer_than_80_chars
              'fetchMoreを実行しRepositoryのレスポンスが0件の場合、state.hasNextPageがfalseになること',
              // ignore: lines_longer_than_80_chars
              'state.hasNextPageがfalseの場合、fetchMoreを実行してもRepository#getが呼ばれないこと',
              // ignore: lines_longer_than_80_chars
              'fetch(isRefresh: true)を実行しRepository#getのレスポンス3件の場合、state.itemsが上書きされること',
            ].join(', '), (tester) async {
          const category = 'general';
          late UseNewsArticlesReturn newsArticles;

          final newsTopHeadlinesRepository = MockNewsTopHeadlinesRepository();

          await tester.pumpWidget(
            TestMaterialApp(
              providerScopeOverrides: [
                newsTopHeadlinesRepositoryProvider
                    .overrideWithValue(newsTopHeadlinesRepository),
              ],
              child: HookConsumer(
                builder: (context, ref, child) {
                  newsArticles = useNewsArticles(category: category);
                  return Container();
                },
              ),
            ),
          );
          await tester.pumpAndSettle();

          // fetchを実行しRepository#getのレスポンス3件の場合、state.itemsに設定されること
          when(
            () => newsTopHeadlinesRepository.get(category: category),
          ).thenAnswer(
            (_) async => NewsTopHeadlinesResponse(
              status: 'ok',
              totalResults: 6,
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
            ),
          );

          await newsArticles.fetch();
          await tester.pumpAndSettle();

          verify(() => newsTopHeadlinesRepository.get(category: category))
              .called(1);
          expect(newsArticles.state.hasValue, isTrue);
          expect(newsArticles.state.hasError, isFalse);
          expect(newsArticles.state.isLoading, isFalse);
          expect(
            newsArticles.state.valueOrNull?.items,
            [
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
          );
          expect(newsArticles.state.valueOrNull?.currentPage, 1);
          expect(newsArticles.state.valueOrNull?.hasNextPage, true);

          // fetchMoreを実行しRepositoryのレスポンスが3件の場合、state.itemsに追加されること
          when(
            () => newsTopHeadlinesRepository.get(category: category, page: 2),
          ).thenAnswer(
            (_) async => NewsTopHeadlinesResponse(
              status: 'ok',
              totalResults: 6,
              articles: [
                dto.NewsArticle(
                  source: dto.NewsArticleSource(id: 'id', name: 'name'),
                  title: 'title4',
                  description: 'description',
                  url: 'https://example.com',
                ),
                dto.NewsArticle(
                  source: dto.NewsArticleSource(id: 'id', name: 'name'),
                  title: 'title5',
                  description: 'description',
                  url: 'https://example.com',
                ),
                dto.NewsArticle(
                  source: dto.NewsArticleSource(id: 'id', name: 'name'),
                  title: 'title6',
                  description: 'description',
                  url: 'https://example.com',
                ),
              ],
            ),
          );

          await newsArticles.fetchMore();
          await tester.pumpAndSettle();

          verify(
            () => newsTopHeadlinesRepository.get(category: category, page: 2),
          ).called(1);
          expect(newsArticles.state.hasValue, isTrue);
          expect(newsArticles.state.hasError, isFalse);
          expect(newsArticles.state.isLoading, isFalse);
          expect(
            newsArticles.state.valueOrNull?.items,
            [
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
              entity.NewsArticle(
                source: entity.NewsArticleSource(id: 'id', name: 'name'),
                title: 'title4',
                description: 'description',
                url: 'https://example.com',
              ),
              entity.NewsArticle(
                source: entity.NewsArticleSource(id: 'id', name: 'name'),
                title: 'title5',
                description: 'description',
                url: 'https://example.com',
              ),
              entity.NewsArticle(
                source: entity.NewsArticleSource(id: 'id', name: 'name'),
                title: 'title6',
                description: 'description',
                url: 'https://example.com',
              ),
            ],
          );
          expect(newsArticles.state.valueOrNull?.currentPage, 2);
          expect(newsArticles.state.valueOrNull?.hasNextPage, true);

          // fetchMoreを実行しRepositoryのレスポンスが0件の場合、state.hasNextPageがfalseになること
          when(
            () => newsTopHeadlinesRepository.get(category: category, page: 3),
          ).thenAnswer(
            (_) async => NewsTopHeadlinesResponse(
              status: 'ok',
              totalResults: 6,
              articles: [],
            ),
          );

          await newsArticles.fetchMore();
          await tester.pumpAndSettle();

          verify(
            () => newsTopHeadlinesRepository.get(category: category, page: 3),
          ).called(1);
          expect(newsArticles.state.hasValue, isTrue);
          expect(newsArticles.state.hasError, isFalse);
          expect(newsArticles.state.isLoading, isFalse);
          expect(newsArticles.state.valueOrNull?.items.length, 6);
          expect(newsArticles.state.valueOrNull?.currentPage, 2);
          expect(newsArticles.state.valueOrNull?.hasNextPage, false);

          // state.hasNextPageがfalseの場合、fetchMoreを実行してもRepository#getが呼ばれないこと
          await newsArticles.fetchMore();
          await tester.pumpAndSettle();

          verifyNever(
            () => newsTopHeadlinesRepository.get(category: category, page: 2),
          );
          expect(newsArticles.state.hasValue, isTrue);
          expect(newsArticles.state.hasError, isFalse);
          expect(newsArticles.state.isLoading, isFalse);
          expect(newsArticles.state.valueOrNull?.items.length, 6);
          expect(newsArticles.state.valueOrNull?.currentPage, 2);
          expect(newsArticles.state.valueOrNull?.hasNextPage, false);

          // ignore: lines_longer_than_80_chars
          // fetch(isRefresh: true)を実行しRepository#getのレスポンス3件の場合、state.itemsが上書きされること
          when(
            () => newsTopHeadlinesRepository.get(category: category),
          ).thenAnswer(
            (_) async => NewsTopHeadlinesResponse(
              status: 'ok',
              totalResults: 6,
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
            ),
          );

          await newsArticles.fetch(isRefresh: true);
          await tester.pumpAndSettle();

          verify(() => newsTopHeadlinesRepository.get(category: category))
              .called(1);
          expect(newsArticles.state.hasValue, isTrue);
          expect(newsArticles.state.hasError, isFalse);
          expect(newsArticles.state.isLoading, isFalse);
          expect(
            newsArticles.state.valueOrNull?.items,
            [
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
          );
          expect(newsArticles.state.valueOrNull?.currentPage, 1);
          expect(newsArticles.state.valueOrNull?.hasNextPage, true);
        });
      });
    });
  });
}
