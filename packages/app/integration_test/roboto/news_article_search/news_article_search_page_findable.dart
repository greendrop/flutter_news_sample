import 'package:app/feature/news_article/widget/news_article_grid_item.dart';
import 'package:app/feature/news_article_search/widget/news_article_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_findable.dart';

class NewsArticleSearchPageFindable
    extends BaseFindable<NewsArticleSearchPage> {
  NewsArticleSearchPageFindable();

  final newsArticleSearchFormKeywordTextField =
      find.byKey(const ValueKey('NewsArticleSearchFormKeywordTextField'));

  final newsArticleSearchFormSubmitButton =
      find.byKey(const ValueKey('NewsArticleSearchFormSubmitButton'));

  final newsArticleGridItems = find.byType(NewsArticleGridItem);

  final newsArticlesNavigationIcon =
      find.byKey(const ValueKey('NewsArticlesNavigationIcon'));

  final newsArticlesSearchNavigationIcon =
      find.byKey(const ValueKey('NewsArticlesSearchNavigationIcon'));

  final settingNavigationIcon =
      find.byKey(const ValueKey('SettingNavigationIcon'));
}
