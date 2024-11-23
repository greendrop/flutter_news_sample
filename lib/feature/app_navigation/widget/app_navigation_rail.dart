import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/localization/hook/use_l10n.dart';
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
    final l10n = useL10n();

    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      destinations: _navigationDestinations(context, ref, l10n: l10n),
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }

  List<NavigationRailDestination> _navigationDestinations(
    BuildContext context,
    WidgetRef ref, {
    required L10n l10n,
  }) {
    return [
      NavigationRailDestination(
        icon: const Icon(
          FontAwesomeIcons.list,
          key: ValueKey('NewsArticlesNavigationIcon'),
        ),
        label: Text(l10n.newsArticleListTitle),
      ),
      NavigationRailDestination(
        icon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          key: ValueKey('NewsArticlesSearchNavigationIcon'),
        ),
        label: Text(l10n.newsArticleSearchTitle),
      ),
      NavigationRailDestination(
        icon: const Icon(
          FontAwesomeIcons.gear,
          key: ValueKey('SettingNavigationIcon'),
        ),
        label: Text(l10n.settingTitle),
      ),
    ];
  }
}
