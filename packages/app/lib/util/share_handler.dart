import 'package:app/exception/app_exception.dart';
import 'package:app/util/result.dart';
import 'package:share_plus/share_plus.dart';

export 'package:share_plus/share_plus.dart'
    show ShareParams, ShareResult, ShareResultStatus;

class ShareHandler {
  Future<Result<ShareResult>> share(ShareParams params) async {
    try {
      final result = await SharePlus.instance.share(params);
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(AppException(parentException: e));
    }
  }
}
