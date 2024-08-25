import 'package:flutter_news_sample/feature/app_navigation/enum/app_navigation_index.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';

int useAppNavigationSelectedIndex({required Uri currentUri}) {
  final currentUriString = currentUri.toString();
  if (currentUriString.startsWith(NewsArticleSearchRouteData().location)) {
    return AppNavigationIndex.newsArticleSearch.value;
  }
  if (currentUriString.startsWith(SettingRouteData().location)) {
    return AppNavigationIndex.setting.value;
  }

  return AppNavigationIndex.newsArticleList.value;
}
