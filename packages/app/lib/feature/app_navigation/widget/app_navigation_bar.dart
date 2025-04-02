import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppNavigationBar extends HookConsumerWidget {
  const AppNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int selectedIndex;
  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationBar(
      destinations: _navigationDestinations(context, ref),
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }

  List<Widget> _navigationDestinations(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();

    return [
      NavigationDestination(
        icon: const Icon(
          FontAwesomeIcons.list,
          key: ValueKey('NewsArticlesNavigationIcon'),
        ),
        label: l10n.newsArticleListTitle,
      ),
      NavigationDestination(
        icon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          key: ValueKey('NewsArticlesSearchNavigationIcon'),
        ),
        label: l10n.newsArticleSearchTitle,
      ),
      NavigationDestination(
        icon: const Icon(
          FontAwesomeIcons.gear,
          key: ValueKey('SettingNavigationIcon'),
        ),
        label: l10n.settingTitle,
      ),
    ];
  }
}
