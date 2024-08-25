import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_navigation/hook/use_app_navigation_selected_index.dart';
import 'package:flutter_news_sample/feature/app_navigation/hook/use_app_navigator_on_destination_selected.dart';
import 'package:flutter_news_sample/feature/app_router/hook/use_app_router_current_uri.dart'
    as hook;
import 'package:flutter_news_sample/feature/news_article_list/hook/use_go_news_article_list_page.dart'
    as hook;
import 'package:flutter_news_sample/feature/news_article_search/hook/use_go_news_article_search_page.dart'
    as hook;
import 'package:flutter_news_sample/feature/setting/hook/use_go_setting_page.dart'
    as hook;
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppNavigationBar extends HookConsumerWidget {
  const AppNavigationBar({
    super.key,
    this.useAppRouterCurrentUri = hook.useAppRouterCurrentUri,
    this.useGoNewsArticleListPage = hook.useGoNewsArticleListPage,
    this.useGoNewsArticleSearchPage = hook.useGoNewsArticleSearchPage,
    this.useGoSettingPage = hook.useGoSettingPage,
  });

  final hook.UseAppRouterCurrentUri useAppRouterCurrentUri;
  final hook.UseGoNewsArticleListPage useGoNewsArticleListPage;
  final hook.UseGoNewsArticleSearchPage useGoNewsArticleSearchPage;
  final hook.UseGoSettingPage useGoSettingPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUri = useAppRouterCurrentUri();
    final goNewsArticleListPage = useGoNewsArticleListPage();
    final goNewsArticleSearchPage = useGoNewsArticleSearchPage();
    final goSettingPage = useGoSettingPage();

    return NavigationBar(
      destinations: _navigationDestinations(context, ref),
      selectedIndex: useAppNavigationSelectedIndex(currentUri: currentUri),
      onDestinationSelected: (index) => useAppNavigatorOnDestinationSelected(
        index: index,
        goNewsArticleListPage: goNewsArticleListPage,
        goNewsArticleSearchPage: goNewsArticleSearchPage,
        goSettingPage: goSettingPage,
      ),
    );
  }

  List<Widget> _navigationDestinations(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    return [
      NavigationDestination(
        key: const ValueKey('NewsArticlesNavigationDestination'),
        icon: const Icon(
          FontAwesomeIcons.list,
          key: ValueKey('NewsArticlesNavigationDestinationIcon'),
        ),
        label: translations.newsArticleList.title,
      ),
      NavigationDestination(
        key: const ValueKey('NewsArticlesSearchNavigationDestination'),
        icon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          key: ValueKey('NewsArticlesSearchNavigationDestinationIcon'),
        ),
        label: translations.newsArticleSearch.title,
      ),
      NavigationDestination(
        key: const ValueKey('SettingNavigationDestination'),
        icon: const Icon(
          FontAwesomeIcons.gear,
          key: ValueKey('SettingNavigationDestinationIcon'),
        ),
        label: translations.setting.title,
      ),
    ];
  }
}
