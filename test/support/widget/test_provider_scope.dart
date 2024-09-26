import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logger.dart';

class TestProviderScope extends HookConsumerWidget {
  const TestProviderScope({
    super.key,
    required this.child,
    this.providerScopeOverrides = const [],
  });

  final Widget child;
  final List<Override> providerScopeOverrides;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        appLoggerProvider.overrideWithValue(buildAppTestLogger()),
        ...providerScopeOverrides,
      ],
      child: child,
    );
  }
}
