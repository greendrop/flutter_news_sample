import '../base_driver.dart';
import 'news_article_list_page_findable.dart';

class NewsArticleListPageDriver extends BaseDriver {
  NewsArticleListPageDriver(super.tester);

  final _findable = NewsArticleListPageFindable();

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
}
