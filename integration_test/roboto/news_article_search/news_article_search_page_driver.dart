import 'package:flutter_test/flutter_test.dart';

import '../base_driver.dart';
import 'news_article_search_page_findable.dart';

class NewsArticleSearchPageDriver extends BaseDriver {
  NewsArticleSearchPageDriver(super.tester);

  final _findable = NewsArticleSearchPageFindable();

  bool get isShown => _findable.isShown;

  Future<void> waitUntileVisible() async {
    await waitFor(_findable.self);
  }

  Future<void> tapNewsArticlesNavigationIcon() async {
    await tester.tap(_findable.newsArticlesNavigationIcon);
  }

  Future<void> tapNewsArticlesSearchNavigationIcon() async {
    await tester.tap(_findable.newsArticlesSearchNavigationIcon);
  }

  Future<void> tapSettingNavigationIcon() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.settingNavigationIcon);
  }

  Future<void> enterKeyword(String keyword) async {
    await tester.pumpAndSettle();
    await tester.enterText(
      _findable.newsArticleSearchFormKeywordTextField,
      keyword,
    );
  }

  Future<void> tapNewsArticleSearchFormSubmitButton() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.newsArticleSearchFormSubmitButton);
  }

  Future<void> expectNewsArticleGridItemCount(int count) async {
    await tester.pumpAndSettle();
    expect(_findable.newsArticleGridItems, findsNWidgets(count));
  }

  Future<void> tapFirstNewsArticleGridItem() async {
    await tester.pumpAndSettle();
    await tester.tap(_findable.newsArticleGridItems.first);
  }
}
