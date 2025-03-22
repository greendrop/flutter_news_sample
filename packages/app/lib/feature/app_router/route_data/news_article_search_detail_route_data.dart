part of 'app_route_data.dart';

class NewsArticleSearchDetailRouteData extends GoRouteData {
  const NewsArticleSearchDetailRouteData({
    required this.title,
    required this.url,
  });

  static final $parentNavigatorKey = rootNavigatorKey;

  final String title;
  final String url;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NewsArticleDetailPage(title: title, url: url);
  }
}
