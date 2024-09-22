import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article/entity/news_article.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_detail_page.dart';
import 'package:flutter_news_sample/feature/news_article_list/entity/news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_list/hook/use_news_articles.dart';
import 'package:flutter_news_sample/feature/news_article_list/widget/news_article_list_page.dart'
    as feature;
import 'package:flutter_news_sample/widget/scaffold_with_nav_bar.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const String _dummyImageUrl = 'https://dummyimage.com/600x400/000/fff';

class NewsArticleListPage extends StatelessWidget {
  const NewsArticleListPage({
    super.key,
    this.isLoading = false,
    this.isEmpty = false,
  });

  final bool isLoading;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    UseNewsArticlesReturn useNewsArticles({required String category}) {
      late AsyncValue<NewsArticles> state;

      if (isLoading) {
        state = const AsyncValue.loading();
      } else if (isEmpty) {
        state = AsyncValue.data(NewsArticles(items: []));
      } else {
        state = AsyncValue.data(
          NewsArticles(
            items: List.generate(30, (index) {
              return NewsArticle(
                title: 'title${index + 1}',
                url: 'https://example.com',
                urlToImage: _dummyImageUrl,
              );
            }),
          ),
        );
      }

      Future<void> fetch({
        bool isRefresh = false,
      }) async {
        return Future.value();
      }

      Future<void> fetchMore() async {
        return Future.value();
      }

      return (
        state: state,
        fetch: fetch,
        fetchMore: fetchMore,
      );
    }

    UsePushNewsArticleDetailPageReturn usePushNewsArticleDetailPage() {
      Future<void> run({required String title, required String url}) {
        return Future.value();
      }

      return (run: run);
    }

    return ScaffoldWithNavBar(
      currentIndex: 0,
      onDestinationSelected: (index) {},
      child: feature.NewsArticleListPage(
        useNewsArticles: useNewsArticles,
        usePushNewsArticleDetailPage: usePushNewsArticleDetailPage,
      ),
    );
  }
}

@UseCase(
  name: 'Default',
  type: NewsArticleListPage,
)
Widget buildNewsArticleListPageDefaultUseCase(BuildContext context) {
  return const NewsArticleListPage();
}

@UseCase(
  name: 'Loading',
  type: NewsArticleListPage,
)
Widget buildNewsArticleListPageLoadingUseCase(BuildContext context) {
  return const NewsArticleListPage(isLoading: true);
}

@UseCase(
  name: 'Empty',
  type: NewsArticleListPage,
)
Widget buildNewsArticleListPageEmptyUseCase(BuildContext context) {
  return const NewsArticleListPage(isEmpty: true);
}
