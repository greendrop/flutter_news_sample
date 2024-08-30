import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppNavigationBar extends HookConsumerWidget {
  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentUri = useAppRouterCurrentUri();

    return NavigationBar(
      destinations: _navigationDestinations(context, ref),
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
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
