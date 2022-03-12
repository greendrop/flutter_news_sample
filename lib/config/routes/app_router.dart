// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:flutter_news_sample/ui/headline/headline_page.dart';
import 'package:flutter_news_sample/ui/setting/setting_page.dart';

class AppRouter {
  GoRouter get router {
    return GoRouter(
      routes: [
        GoRoute(
          name: 'headline',
          path: '/',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const HeadlinePage(),
          ),
        ),
        GoRoute(
          name: 'setting',
          path: '/setting',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const SettingPage(),
          ),
        ),
      ],
    );
  }
}
