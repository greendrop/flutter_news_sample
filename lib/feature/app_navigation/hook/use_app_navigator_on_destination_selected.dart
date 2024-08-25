import 'package:flutter_news_sample/feature/app_navigation/enum/app_navigation_index.dart';
import 'package:flutter_news_sample/feature/news_article_list/hook/use_go_news_article_list_page.dart';
import 'package:flutter_news_sample/feature/news_article_search/hook/use_go_news_article_search_page.dart';
import 'package:flutter_news_sample/feature/setting/hook/use_go_setting_page.dart';

void useAppNavigatorOnDestinationSelected({
  required int index,
  required UseGoNewsArticleListPageReturn goNewsArticleListPage,
  required UseGoNewsArticleSearchPageReturn goNewsArticleSearchPage,
  required UseGoSettingPageReturn goSettingPage,
}) {
  switch (AppNavigationIndex.fromValue(index)) {
    case AppNavigationIndex.newsArticleList:
      return goNewsArticleListPage.run();
    case AppNavigationIndex.newsArticleSearch:
      return goNewsArticleSearchPage.run();
    case AppNavigationIndex.setting:
      return goSettingPage.run();
  }
}
