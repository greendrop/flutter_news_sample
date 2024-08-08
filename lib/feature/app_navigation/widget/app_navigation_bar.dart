import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/setting/hook/use_go_setting_page.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppNavigationBar extends HookConsumerWidget {
  const AppNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goSettingPage = useGoSettingPage();

    return NavigationBar(
      destinations: _navigationDestinations(context, ref),
      selectedIndex: _selectedIndex(context, ref),
      onDestinationSelected: (index) => _onDestinationSelected(
        context,
        ref,
        index: index,
        goSettingPage: goSettingPage,
      ),
    );
  }

  List<Widget> _navigationDestinations(BuildContext context, WidgetRef ref) {
    final translations = useTranslations();
    return [
      NavigationDestination(
        icon: const Icon(FontAwesomeIcons.gear),
        label: translations.setting.title,
      ),
      NavigationDestination(
        icon: const Icon(FontAwesomeIcons.gear),
        label: translations.setting.title,
      ),
    ];
  }

  int _selectedIndex(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/setting')) {
      return 0;
    }

    return 0;
  }

  void _onDestinationSelected(
    BuildContext context,
    WidgetRef ref, {
    required int index,
    required UseGoSettingPageReturn goSettingPage,
  }) {
    switch (index) {
      case 0:
        goSettingPage.run();
    }
  }
}
