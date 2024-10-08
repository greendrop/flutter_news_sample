// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_route_data.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRouteData,
      $notFoundRouteData,
    ];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
      factory: $AppShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: NewsArticleBranchData.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/news_articles',
              factory: $NewsArticleListRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'detail',
                  parentNavigatorKey:
                      NewsArticleDetailRouteData.$parentNavigatorKey,
                  factory: $NewsArticleDetailRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: NewsArticleSearchBranchData.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/news_articles_search',
              factory: $NewsArticleSearchRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'detail',
                  parentNavigatorKey:
                      NewsArticleSearchDetailRouteData.$parentNavigatorKey,
                  factory:
                      $NewsArticleSearchDetailRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: SettingBranchData.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/setting',
              factory: $SettingRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'theme',
                  parentNavigatorKey: ThemeSettingRouteData.$parentNavigatorKey,
                  factory: $ThemeSettingRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'locale',
                  parentNavigatorKey:
                      LocaleSettingRouteData.$parentNavigatorKey,
                  factory: $LocaleSettingRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'dev_tool',
                  parentNavigatorKey: DevToolRouteData.$parentNavigatorKey,
                  factory: $DevToolRouteDataExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'app_logs',
                      parentNavigatorKey:
                          AppLogListRouteData.$parentNavigatorKey,
                      factory: $AppLogListRouteDataExtension._fromState,
                      routes: [
                        GoRouteData.$route(
                          path: ':filename',
                          parentNavigatorKey:
                              AppLogDetailRouteData.$parentNavigatorKey,
                          factory: $AppLogDetailRouteDataExtension._fromState,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

extension $NewsArticleListRouteDataExtension on NewsArticleListRouteData {
  static NewsArticleListRouteData _fromState(GoRouterState state) =>
      NewsArticleListRouteData(
        category: state.uri.queryParameters['category'],
      );

  String get location => GoRouteData.$location(
        '/news_articles',
        queryParams: {
          if (category != null) 'category': category,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewsArticleDetailRouteDataExtension on NewsArticleDetailRouteData {
  static NewsArticleDetailRouteData _fromState(GoRouterState state) =>
      NewsArticleDetailRouteData(
        title: state.uri.queryParameters['title']!,
        url: state.uri.queryParameters['url']!,
      );

  String get location => GoRouteData.$location(
        '/news_articles/detail',
        queryParams: {
          'title': title,
          'url': url,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewsArticleSearchRouteDataExtension on NewsArticleSearchRouteData {
  static NewsArticleSearchRouteData _fromState(GoRouterState state) =>
      NewsArticleSearchRouteData();

  String get location => GoRouteData.$location(
        '/news_articles_search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewsArticleSearchDetailRouteDataExtension
    on NewsArticleSearchDetailRouteData {
  static NewsArticleSearchDetailRouteData _fromState(GoRouterState state) =>
      NewsArticleSearchDetailRouteData(
        title: state.uri.queryParameters['title']!,
        url: state.uri.queryParameters['url']!,
      );

  String get location => GoRouteData.$location(
        '/news_articles_search/detail',
        queryParams: {
          'title': title,
          'url': url,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingRouteDataExtension on SettingRouteData {
  static SettingRouteData _fromState(GoRouterState state) => SettingRouteData();

  String get location => GoRouteData.$location(
        '/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ThemeSettingRouteDataExtension on ThemeSettingRouteData {
  static ThemeSettingRouteData _fromState(GoRouterState state) =>
      ThemeSettingRouteData();

  String get location => GoRouteData.$location(
        '/setting/theme',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LocaleSettingRouteDataExtension on LocaleSettingRouteData {
  static LocaleSettingRouteData _fromState(GoRouterState state) =>
      LocaleSettingRouteData();

  String get location => GoRouteData.$location(
        '/setting/locale',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DevToolRouteDataExtension on DevToolRouteData {
  static DevToolRouteData _fromState(GoRouterState state) => DevToolRouteData();

  String get location => GoRouteData.$location(
        '/setting/dev_tool',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppLogListRouteDataExtension on AppLogListRouteData {
  static AppLogListRouteData _fromState(GoRouterState state) =>
      AppLogListRouteData();

  String get location => GoRouteData.$location(
        '/setting/dev_tool/app_logs',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppLogDetailRouteDataExtension on AppLogDetailRouteData {
  static AppLogDetailRouteData _fromState(GoRouterState state) =>
      AppLogDetailRouteData(
        filename: state.pathParameters['filename']!,
      );

  String get location => GoRouteData.$location(
        '/setting/dev_tool/app_logs/${Uri.encodeComponent(filename)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $notFoundRouteData => GoRouteData.$route(
      path: '/:path(.*)',
      parentNavigatorKey: NotFoundRouteData.$parentNavigatorKey,
      factory: $NotFoundRouteDataExtension._fromState,
    );

extension $NotFoundRouteDataExtension on NotFoundRouteData {
  static NotFoundRouteData _fromState(GoRouterState state) => NotFoundRouteData(
        path: state.pathParameters['path']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(path)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
