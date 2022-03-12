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
    HeadlineRoute.name: (routeData) {
      return MaterialPageX<Widget>(
          routeData: routeData, child: const HeadlinePage());
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
              redirectTo: 'headline',
              fullMatch: true),
          RouteConfig(HeadlineRoute.name,
              path: 'headline', parent: MainRoute.name),
          RouteConfig(SettingRoute.name,
              path: 'setting', parent: MainRoute.name)
        ])
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
/// [HeadlinePage]
class HeadlineRoute extends PageRouteInfo<void> {
  const HeadlineRoute() : super(HeadlineRoute.name, path: 'headline');

  static const String name = 'HeadlineRoute';
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}
