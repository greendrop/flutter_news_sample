part of 'app_route_data.dart';

class NewsArticleListRouteData extends GoRouteData {
  const NewsArticleListRouteData({this.category});

  final String? category;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NewsArticleListPage(
      initialCategory: NewsHeadlineCategory.fromValue(
        category ?? NewsArticleListPage.defaultCategory.value,
      ),
    );
  }
}
