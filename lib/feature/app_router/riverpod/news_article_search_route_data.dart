import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_article_search_route_data.g.dart';

@riverpod
NewsArticleSearchRouteData newsArticleSearchRouteData(
  NewsArticleSearchRouteDataRef ref,
) {
  return NewsArticleSearchRouteData();
}
