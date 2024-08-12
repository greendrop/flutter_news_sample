import 'dart:ui';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/share/riverpod/share_wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'package:url_launcher/url_launcher.dart' show LaunchMode;

typedef UseShareWrapperReturn = ({
  Future<void> Function(
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
  }) share,
});

typedef UseShareWrapper = UseShareWrapperReturn Function();

const String _hookName = 'UseShareWrapper';

UseShareWrapperReturn useShareWrapper() {
  final context = useContext();
  final ref = context as WidgetRef;

  final share = useCallback(
    (
      String text, {
      String? subject,
      Rect? sharePositionOrigin,
    }) {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#share',
          {
            'text': text,
            'subject': subject,
            'sharePositionOrigin': sharePositionOrigin,
          },
        ],
      );

      return ref.read(shareWrapperProvider).share(
            text,
            subject: subject,
            sharePositionOrigin: sharePositionOrigin,
          );
    },
    [],
  );

  return (share: share);
}
