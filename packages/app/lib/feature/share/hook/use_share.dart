import 'package:app/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

export 'package:share_plus/share_plus.dart' show ShareParams, ShareResult;

typedef UseShareReturn =
    ({Future<ShareResult> Function(ShareParams params) run});

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
    return SharePlus.instance.share(params);
  }, []);

  return (run: run);
}

const UseShare useShare = useShareImpl;
