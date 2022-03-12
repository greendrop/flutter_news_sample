// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBottomNavigationBar extends HookConsumerWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;

    return BottomNavigationBar(
      currentIndex: _currentIndex(context),
      onTap: (index) => _onTap(context, index),
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
  }

  int _currentIndex(BuildContext context) {
    final goRouter = GoRouter.of(context);
    final location = goRouter.location;
    final routes = goRouter.routerDelegate.routes.reversed;
    var index = routes.length - 1;

    GoRouter.of(context).routerDelegate.routes.reversed.forEach((route) {
      if (route.path.startsWith(location)) {
        return;
      }
      index--;
    });

    return index;
  }

  void _onTap(BuildContext context, int index) {
    final goRouter = GoRouter.of(context);

    switch (index) {
      case 1:
        goRouter.goNamed('setting');
        break;
      default:
        goRouter.goNamed('headline');
    }
  }
}
