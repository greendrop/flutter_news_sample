import 'package:app/feature/app_logger/riverpod/app_logger.dart';
import 'package:app/riverpod/share_handler.dart';
import 'package:app/util/result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'package:app/riverpod/share_handler.dart'
    show ShareParams, ShareResult, ShareResultStatus;

typedef UseShareReturn =
    ({Future<Result<ShareResult>> Function(ShareParams params) run});

typedef UseShare = UseShareReturn Function();

const String _hookName = 'UseShare';

UseShareReturn useShareImpl() {
  final context = useContext();
  final ref = context as WidgetRef;

  final run = useCallback((ShareParams params) {
    ref.read(appLoggerProvider).i([
      '$_hookName#run',
      {'params': params},
    ]);

    return ref.read(shareHandlerProvider).share(params);
  }, []);

  return (run: run);
}

const UseShare useShare = useShareImpl;
