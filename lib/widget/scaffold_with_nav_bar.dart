import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_bar.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_rail.dart';
import 'package:flutter_news_sample/feature/app_router/hook/use_app_router_current_uri.dart'
    as hook;
import 'package:flutter_news_sample/feature/media_query/hook/use_media_query.dart';
import 'package:flutter_news_sample/feature/news_article_list/hook/use_go_news_article_list_page.dart'
    as hook;
import 'package:flutter_news_sample/feature/news_article_search/hook/use_go_news_article_search_page.dart'
    as hook;
import 'package:flutter_news_sample/feature/setting/hook/use_go_setting_page.dart'
    as hook;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScaffoldWithNavBar extends HookConsumerWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.child,
    this.useAppRouterCurrentUri = hook.useAppRouterCurrentUri,
    this.useGoNewsArticleListPage = hook.useGoNewsArticleListPage,
    this.useGoNewsArticleSearchPage = hook.useGoNewsArticleSearchPage,
    this.useGoSettingPage = hook.useGoSettingPage,
  });

  final Widget child;
  final hook.UseAppRouterCurrentUri useAppRouterCurrentUri;
  final hook.UseGoNewsArticleListPage useGoNewsArticleListPage;
  final hook.UseGoNewsArticleSearchPage useGoNewsArticleSearchPage;
  final hook.UseGoSettingPage useGoSettingPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQueryData = useMediaQueryData();

    if (mediaQueryData.orientation == Orientation.portrait) {
      // 画面が縦向きの場合
      return _buildPortrait(context, ref);
    } else {
      // 画面が横向きの場合
      return _buildLandscape(context, ref);
    }
  }

  Widget _buildPortrait(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppNavigationBar(
        useAppRouterCurrentUri: useAppRouterCurrentUri,
        useGoNewsArticleListPage: useGoNewsArticleListPage,
        useGoNewsArticleSearchPage: useGoNewsArticleSearchPage,
        useGoSettingPage: useGoSettingPage,
      ),
    );
  }

  Widget _buildLandscape(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          AppNavigationRail(
            useAppRouterCurrentUri: useAppRouterCurrentUri,
            useGoNewsArticleListPage: useGoNewsArticleListPage,
            useGoNewsArticleSearchPage: useGoNewsArticleSearchPage,
            useGoSettingPage: useGoSettingPage,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
