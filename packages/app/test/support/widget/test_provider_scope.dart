import 'package:app/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logger.dart';

class TestProviderScope extends HookConsumerWidget {
  const TestProviderScope({
    required this.child,
    this.providerScopeOverrides = const [],
    super.key,
  });

  final Widget child;
  final List<Override> providerScopeOverrides;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        // テスト用のLoggerで上書きするため
        // ignore: scoped_providers_should_specify_dependencies
        appLoggerProvider.overrideWithValue(buildAppTestLogger()),
        ...providerScopeOverrides,
      ],
      child: child,
    );
  }
}
