import 'dart:io';

import 'package:flutter_news_sample/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../roboto/news_article_detail/news_article_detail_page_driver.dart';
import '../roboto/news_article_list/news_article_list_page_driver.dart';
import '../roboto/news_article_search/news_article_search_page_driver.dart';
import '../support/integration_test_widgets.dart';
import '../wiremock/newsapi/everything/success.dart';
import '../wiremock/newsapi/top_headlines/success.dart';
import '../wiremock/reset.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('News Article Search', () {
    integrationTestWidgets('記事の検索・詳細が表示できること', binding, (tester) async {
      await resetMockApi();
      await createNewsApiTopHeadlinesSuccessMockApi();
      await createNewsApiEverythingSuccessMockApi();

      await app.main();

      final newsArticleListPageDriver = NewsArticleListPageDriver(tester);
      await newsArticleListPageDriver.waitUntileVisible();
      await newsArticleListPageDriver.tapNewsArticlesSearchNavigationIcon();

      final newsArticleSearchPageDriver = NewsArticleSearchPageDriver(tester);
      await newsArticleSearchPageDriver.waitUntileVisible();
      await newsArticleSearchPageDriver.enterKeyword('keyword');
      await newsArticleSearchPageDriver.tapNewsArticleSearchFormSubmitButton();
      await newsArticleSearchPageDriver.expectNewsArticleGridItemCount(3);
      await newsArticleSearchPageDriver.tapFirstNewsArticleGridItem();

      final newsArticleDetailPageDriver = NewsArticleDetailPageDriver(tester);
      await newsArticleDetailPageDriver.waitUntileVisible();
      await newsArticleDetailPageDriver.expectTitle('title_1');

      // GitHub Actions で稀にエラーとなるため、一時的に sleep を入れる
      sleep(const Duration(seconds: 1));

      await newsArticleDetailPageDriver.tapBack();

      await newsArticleSearchPageDriver.waitUntileVisible();
    });
  });
}
