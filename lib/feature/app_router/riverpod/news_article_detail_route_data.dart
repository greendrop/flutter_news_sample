import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_article_detail_route_data.g.dart';

@riverpod
NewsArticleDetailRouteData newsArticleDetailRouteData(
  NewsArticleDetailRouteDataRef ref, {
  required String title,
  required String url,
}) {
  return NewsArticleDetailRouteData(title: title, url: url);
}
