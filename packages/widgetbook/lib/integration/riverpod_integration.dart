// ref: https://zenn.dev/yumemi_inc/articles/flutter-with-widgetbook-riverpod

// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook/widgetbook.dart';

class RiverpodIntegration extends WidgetbookIntegration {
  ProviderContainer get container {
    final overrides = _overrides;
    _overrides = [];
    return ProviderContainer(overrides: overrides);
  }

  // ignore: avoid_setters_without_getters
  set overrides(List<Override> value) => _overrides = value;

  List<Override> _overrides = [];
}

extension RiverpodIntegrationExtension on WidgetbookState {
  RiverpodIntegration? get riverpodIntegration =>
      // ignore: cast_nullable_to_non_nullable
      integrations?.firstWhere((element) => element is RiverpodIntegration)
          as RiverpodIntegration?;
}
