import 'package:app/feature/news_article/widget/news_article_grid_item.dart';
import 'package:app/feature/news_article_list/widget/news_article_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_findable.dart';

class NewsArticleListPageFindable extends BaseFindable<NewsArticleListPage> {
  NewsArticleListPageFindable();

  final newsArticleGridItems = find.byType(NewsArticleGridItem);

  final newsArticlesNavigationIcon =
      find.byKey(const ValueKey('NewsArticlesNavigationIcon'));

  final newsArticlesSearchNavigationIcon =
      find.byKey(const ValueKey('NewsArticlesSearchNavigationIcon'));

  final settingNavigationIcon =
      find.byKey(const ValueKey('SettingNavigationIcon'));
}
