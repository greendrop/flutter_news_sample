import 'package:app/util/share_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:app/util/share_handler.dart'
    show ShareParams, ShareResult, ShareResultStatus;

part 'share_handler.g.dart';

@riverpod
ShareHandler shareHandler(Ref ref) {
  return ShareHandler();
}
