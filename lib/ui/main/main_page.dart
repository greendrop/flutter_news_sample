// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/config/routes/app_router.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        HeadlineRoute(),
        SettingRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        final l10n = L10n.of(context)!;

        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.list),
              label: l10n.headlineTitle,
            ),
            BottomNavigationBarItem(
              icon: const Icon(FontAwesomeIcons.cog),
              label: l10n.settingTitle,
            )
          ],
        );
      },
    );
  }
}
