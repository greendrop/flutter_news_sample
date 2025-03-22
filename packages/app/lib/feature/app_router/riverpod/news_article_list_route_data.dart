import 'package:app/feature/app_router/route_data/app_route_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_article_list_route_data.g.dart';

@riverpod
NewsArticleListRouteData newsArticleListRouteData(
  Ref ref, {
  required String? category,
}) {
  return NewsArticleListRouteData(category: category);
}
