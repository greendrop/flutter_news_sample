import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_article_list_route_data.g.dart';

@riverpod
NewsArticleListRouteData newsArticleListRouteData(
  NewsArticleListRouteDataRef ref, {
  required String category,
}) {
  return NewsArticleListRouteData(category: category);
}
