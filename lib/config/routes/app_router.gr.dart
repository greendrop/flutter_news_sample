// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return MaterialPageX<Widget>(
          routeData: routeData, child: const MainPage());
    },
    NewsDetailRoute.name: (routeData) {
      return MaterialPageX<Widget>(
          routeData: routeData, child: const NewsDetailPage());
    },
    NewsHeadlineRoute.name: (routeData) {
      return MaterialPageX<Widget>(
          routeData: routeData, child: const NewsHeadlinePage());
    },
    NewsSearchRoute.name: (routeData) {
      return MaterialPageX<Widget>(
          routeData: routeData, child: const NewsSearchPage());
    },
    SettingRoute.name: (routeData) {
      return MaterialPageX<Widget>(
          routeData: routeData, child: const SettingPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(MainRoute.name, path: '/', children: [
          RouteConfig('#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'news_headline',
              fullMatch: true),
          RouteConfig(NewsHeadlineRoute.name,
              path: 'news_headline', parent: MainRoute.name),
          RouteConfig(NewsSearchRoute.name,
              path: 'news_search', parent: MainRoute.name),
          RouteConfig(SettingRoute.name,
              path: 'setting', parent: MainRoute.name)
        ]),
        RouteConfig(NewsDetailRoute.name, path: '/news_detail')
      ];
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [NewsDetailPage]
class NewsDetailRoute extends PageRouteInfo<void> {
  const NewsDetailRoute() : super(NewsDetailRoute.name, path: '/news_detail');

  static const String name = 'NewsDetailRoute';
}

/// generated route for
/// [NewsHeadlinePage]
class NewsHeadlineRoute extends PageRouteInfo<void> {
  const NewsHeadlineRoute()
      : super(NewsHeadlineRoute.name, path: 'news_headline');

  static const String name = 'NewsHeadlineRoute';
}

/// generated route for
/// [NewsSearchPage]
class NewsSearchRoute extends PageRouteInfo<void> {
  const NewsSearchRoute() : super(NewsSearchRoute.name, path: 'news_search');

  static const String name = 'NewsSearchRoute';
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}
