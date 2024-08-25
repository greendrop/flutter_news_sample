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

class AppNavigationRail extends HookConsumerWidget {
  const AppNavigationRail({
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
    final translations = useTranslations();
    final currentUri = useAppRouterCurrentUri();
    final goNewsArticleListPage = useGoNewsArticleListPage();
    final goNewsArticleSearchPage = useGoNewsArticleSearchPage();
    final goSettingPage = useGoSettingPage();

    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      destinations:
          _navigationDestinations(context, ref, translations: translations),
      selectedIndex: useAppNavigationSelectedIndex(currentUri: currentUri),
      onDestinationSelected: (index) => useAppNavigatorOnDestinationSelected(
        index: index,
        goNewsArticleListPage: goNewsArticleListPage,
        goNewsArticleSearchPage: goNewsArticleSearchPage,
        goSettingPage: goSettingPage,
      ),
    );
  }

  List<NavigationRailDestination> _navigationDestinations(
    BuildContext context,
    WidgetRef ref, {
    required Translations translations,
  }) {
    return [
      NavigationRailDestination(
        icon: const Icon(
          FontAwesomeIcons.list,
          key: ValueKey(
            'NewsArticlesNavigationRailDestinationIcon',
          ),
        ),
        label: Text(translations.newsArticleList.title),
      ),
      NavigationRailDestination(
        icon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          key: ValueKey(
            'NewsArticlesSearchNavigationRailDestinationIcon',
          ),
        ),
        label: Text(translations.newsArticleSearch.title),
      ),
      NavigationRailDestination(
        icon: const Icon(
          FontAwesomeIcons.gear,
          key: ValueKey(
            'SettingNavigationRailDestinationIcon',
          ),
        ),
        label: Text(translations.setting.title),
      ),
    ];
  }
}
