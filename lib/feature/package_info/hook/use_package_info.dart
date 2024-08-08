import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter_news_sample/feature/package_info/riverpod/package_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

typedef UsePackageInfoReturn = ({
  AsyncValue<PackageInfo> state,
  AsyncValue<PackageInfo> Function() refresh,
});

typedef UsePackageInfo = UsePackageInfoReturn Function();

const String _hookName = 'usePackageInfo';

UsePackageInfoReturn usePackageInfo() {
  final context = useContext();
  final ref = context as WidgetRef;
  final appLogger = useAppLogger();

  final state = ref.watch(packageInfoProvider);

  final refresh = useCallback(
    () {
      appLogger.i(['$_hookName#refresh']);
      return ref.refresh(packageInfoProvider);
    },
    [state],
  );

  return (
    state: state,
    refresh: refresh,
  );
}
