import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/package_info/riverpod/package_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

typedef UsePackageInfoReturn = ({
  PackageInfo? state,
  Future<void> Function() initialize,
  Future<void> Function() refresh,
});

typedef UsePackageInfo = UsePackageInfoReturn Function();

const String _hookName = 'usePackageInfo';

UsePackageInfoReturn usePackageInfo() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final state = ref.watch(packageInfoNotifierProvider);

  final initialize = useCallback(
    () {
      appLogger.i(['$_hookName#initialize']);
      return ref.refresh(packageInfoNotifierProvider.notifier).initialize();
    },
    [],
  );

  final refresh = useCallback(
    () {
      appLogger.i(['$_hookName#refresh']);
      return ref.read(packageInfoNotifierProvider.notifier).refresh();
    },
    [],
  );

  return (
    state: state,
    initialize: initialize,
    refresh: refresh,
  );
}
