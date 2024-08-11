import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'share_wrapper.g.dart';

class ShareWrapper {
  Future<void> share(
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
  }) {
    return Share.share(
      text,
      subject: subject,
      sharePositionOrigin: sharePositionOrigin,
    );
  }
}

@riverpod
ShareWrapper shareWrapper(ShareWrapperRef ref) {
  return ShareWrapper();
}
