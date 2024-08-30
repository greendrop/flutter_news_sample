import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppNavigationRail extends HookConsumerWidget {
  const AppNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();

    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      destinations:
          _navigationDestinations(context, ref, translations: translations),
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
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
