import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_bar.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_rail.dart';
import 'package:flutter_news_sample/feature/media_query/hook/use_media_query.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScaffoldWithNavBar extends HookConsumerWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.child,
  });

  final int currentIndex;
  final void Function(int) onDestinationSelected;
  final Widget child;

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
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }

  Widget _buildLandscape(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          AppNavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
