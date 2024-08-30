import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_detail/widget/app_log_detail_page.dart';
import 'package:flutter_news_sample/feature/app_log_list/widget/app_log_list_page.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/dev_tool_page.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_page.dart';
import 'package:flutter_news_sample/feature/news_article_detail/widget/news_article_detail_page.dart';
import 'package:flutter_news_sample/feature/news_article_list/widget/news_article_list_page.dart';
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_page.dart';
import 'package:flutter_news_sample/feature/not_found/widget/not_found_page.dart';
import 'package:flutter_news_sample/feature/setting/widget/setting_page.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_page.dart';
import 'package:flutter_news_sample/widget/scaffold_with_nav_bar.dart';
import 'package:go_router/go_router.dart';

part 'app_log_detail_route_data.dart';
part 'app_log_list_route_data.dart';
part 'dev_tool_route_data.dart';
part 'locale_setting_route_data.dart';
part 'news_article_branch_data.dart';
part 'news_article_detail_route_data.dart';
part 'news_article_list_route_data.dart';
part 'news_article_search_branch_data.dart';
part 'news_article_search_detail_route_data.dart';
part 'news_article_search_route_data.dart';
part 'setting_branch_data.dart';
part 'setting_route_data.dart';
part 'theme_setting_route_data.dart';

part 'app_route_data.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final newsArticleBranchNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'news_article_branch');
final newsArticleSearchBranchNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'news_article_search_branch');
final settingBranchNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'setting_branch');

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<NewsArticleBranchData>(
      routes: [
        TypedGoRoute<NewsArticleListRouteData>(
          path: '/news_articles',
          name: NewsArticleListPage.routeName,
          routes: [
            TypedGoRoute<NewsArticleDetailRouteData>(
              path: 'detail',
              name: NewsArticleDetailPage.routeName,
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<NewsArticleSearchBranchData>(
      routes: [
        TypedGoRoute<NewsArticleSearchRouteData>(
          path: '/news_articles_search',
          name: NewsArticleSearchPage.routeName,
          routes: [
            TypedGoRoute<NewsArticleSearchDetailRouteData>(
              path: 'detail',
              name: NewsArticleDetailPage.routeNameForSearch,
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingBranchData>(
      routes: [
        TypedGoRoute<SettingRouteData>(
          path: '/setting',
          name: SettingPage.routeName,
          routes: [
            TypedGoRoute<ThemeSettingRouteData>(
              path: 'theme',
              name: ThemeSettingPage.routeName,
            ),
            TypedGoRoute<LocaleSettingRouteData>(
              path: 'locale',
              name: LocaleSettingPage.routeName,
            ),
            TypedGoRoute<DevToolRouteData>(
              path: 'dev_tool',
              name: DevToolPage.routeName,
              routes: [
                TypedGoRoute<AppLogListRouteData>(
                  path: 'app_logs',
                  name: AppLogListPage.routeName,
                  routes: [
                    TypedGoRoute<AppLogDetailRouteData>(
                      path: ':filename',
                      name: AppLogDetailPage.routeName,
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
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  static final $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ScaffoldWithNavBar(
      currentIndex: navigationShell.currentIndex,
      onDestinationSelected: (index) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },
      child: navigationShell,
    );
  }
}

@TypedGoRoute<NotFoundRouteData>(
  path: '/:path(.*)',
  name: NotFoundPage.routeName,
)
class NotFoundRouteData extends GoRouteData {
  const NotFoundRouteData({
    required this.path,
  });

  static final $parentNavigatorKey = rootNavigatorKey;

  final String path;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotFoundPage();
  }
}
