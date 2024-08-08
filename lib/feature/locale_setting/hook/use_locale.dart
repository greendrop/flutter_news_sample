import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/locale_setting/riverpod/locale_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef UseLocaleReturn = ({
  Locale? state,
  Future<void> Function() initialize,
  Future<void> Function(Locale?) update,
});

typedef UseLocale = UseLocaleReturn Function();

const String _hookName = 'useLocale';

UseLocaleReturn useLocale() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final state = ref.watch(localeNotifierProvider);

  final initialize = useCallback(
    () {
      appLogger.i(['$_hookName#initialize']);
      return ref.read(localeNotifierProvider.notifier).initialize();
    },
    [],
  );

  final update = useCallback(
    (Locale? value) {
      appLogger.i([
        '$_hookName#update',
        {'value': value},
      ]);
      return ref.read(localeNotifierProvider.notifier).setLocale(value);
    },
    [],
  );

  return (
    state: state,
    initialize: initialize,
    update: update,
  );
}
