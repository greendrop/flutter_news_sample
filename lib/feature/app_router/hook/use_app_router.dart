import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/feature/app_log_detail/widget/app_log_detail_page.dart';
import 'package:flutter_news_sample/feature/app_log_list/widget/app_log_list_page.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/dev_tool/widget/dev_tool_page.dart';
import 'package:flutter_news_sample/feature/locale_setting/widget/locale_setting_page.dart';
import 'package:flutter_news_sample/feature/news_article_list/widget/news_article_list_page.dart';
import 'package:flutter_news_sample/feature/not_found/widget/not_found_page.dart';
import 'package:flutter_news_sample/feature/setting/widget/setting_page.dart';
import 'package:flutter_news_sample/feature/theme_setting/widget/theme_setting_page.dart';
import 'package:flutter_news_sample/widget/scaffold_with_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter useAppRouter({String initialLocation = '/news_articles'}) {
  final appLogger = useAppLogger();

  final newsGoRoute = GoRoute(
    path: '/news_articles',
    name: NewsArticleListPage.routeName,
    builder: (context, state) {
      return const NewsArticleListPage();
    },
  );

  final settingGoRoute = GoRoute(
    path: '/setting',
    name: SettingPage.routeName,
    builder: (context, state) {
      return const SettingPage();
    },
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: 'theme',
        name: ThemeSettingPage.routeName,
        builder: (context, state) {
          return const ThemeSettingPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: 'locale',
        name: LocaleSettingPage.routeName,
        builder: (context, state) {
          return const LocaleSettingPage();
        },
      ),
    ],
  );

  final devToolGoRoute = GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: '/dev_tool',
    name: DevToolPage.routeName,
    builder: (context, state) {
      return const DevToolPage();
    },
    routes: [
      GoRoute(
        path: 'app_logs',
        name: AppLogListPage.routeName,
        builder: (context, state) {
          return const AppLogListPage();
        },
        routes: [
          GoRoute(
            path: ':filename',
            name: AppLogDetailPage.routeName,
            builder: (context, state) {
              final filename = state.pathParameters['filename'] ?? '';
              return AppLogDetailPage(filename: filename);
            },
          ),
        ],
      ),
    ],
  );

  final notFoundGoRoute = GoRoute(
    path: '/:path(.*)',
    name: NotFoundPage.routeName,
    builder: (context, state) {
      return const NotFoundPage();
    },
  );

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initialLocation,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          newsGoRoute,
          settingGoRoute,
        ],
      ),
      AppConfig.instance.showDevTool ? devToolGoRoute : null,
      notFoundGoRoute,
    ].whereNotNull().toList(),
    // NOTE： ログイン状態を判断・リダイレクトなどを行いたい場合、 redirect, refreshListenable を使用する
    // redirect: (context, state) {
    //   return null;
    // },
    // refreshListenable: null,
    observers: [
      _LoggerNavigatorObserver(logger: appLogger),
    ],
  );
}

class _LoggerNavigatorObserver extends NavigatorObserver {
  _LoggerNavigatorObserver({required this.logger});

  final Logger logger;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    logger.i(
      [
        'Navigator didPush',
        {
          'settingsName': route.settings.name,
          'settingsArguments': route.settings.arguments.toString(),
        }
      ],
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    logger.i(
      [
        'Navigator didPop',
        {
          'settingsName': route.settings.name,
          'settingsArguments': route.settings.arguments.toString(),
        }
      ],
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    logger.i(
      [
        'Navigator didRemove',
        {
          'settingsName': route.settings.name,
          'settingsArguments': route.settings.arguments.toString(),
        }
      ],
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    logger.i(
      [
        'Navigator didReplace',
        {
          'settingsName': newRoute?.settings.name,
          'settingsArguments': newRoute?.settings.arguments.toString(),
        }
      ],
    );
  }
}
