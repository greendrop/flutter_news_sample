import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_navigation/widget/app_navigation_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScaffoldWithNavBar extends HookConsumerWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}
