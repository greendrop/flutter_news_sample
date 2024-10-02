import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/theme_setting/riverpod/theme_mode_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseThemeModeReturn = ({
  ThemeMode state,
  Future<void> Function() initialize,
  Future<void> Function(ThemeMode) update,
});

typedef UseThemeMode = UseThemeModeReturn Function();

const String _hookName = 'useThemeMode';

UseThemeModeReturn useThemeModeImpl() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final state = ref.watch(themeModeNotifierProvider);

  final initialize = useCallback(
    () {
      appLogger.i(['$_hookName#initialize']);
      return ref.read(themeModeNotifierProvider.notifier).initialize();
    },
    [state],
  );

  final update = useCallback(
    (ThemeMode value) {
      appLogger.i([
        '$_hookName#update',
        {'value': value},
      ]);
      return ref.read(themeModeNotifierProvider.notifier).setThemeMode(value);
    },
    [state],
  );

  return (
    state: state,
    initialize: initialize,
    update: update,
  );
}

final UseThemeMode useThemeMode = useThemeModeImpl;
