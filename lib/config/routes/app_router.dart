// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:flutter_news_sample/ui/main/main_page.dart';
import 'package:flutter_news_sample/ui/news_detail/news_detail.dart';
import 'package:flutter_news_sample/ui/news_headline/news_headline_page.dart';
import 'package:flutter_news_sample/ui/setting/setting_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<Widget>>[
    AutoRoute(
      path: '/',
      page: MainPage,
      children: [
        AutoRoute<Widget>(
          path: 'news_headline',
          page: NewsHeadlinePage,
          initial: true,
        ),
        AutoRoute<Widget>(path: 'setting', page: SettingPage),
      ],
    ),
    AutoRoute<Widget>(path: '/news_detail', page: NewsDetailPage),
  ],
)
class AppRouter extends _$AppRouter {}
