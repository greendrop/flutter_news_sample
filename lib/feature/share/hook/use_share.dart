import 'dart:ui';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

typedef UseShareReturn = ({
  Future<void> Function(
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
  }) run,
  Future<void> Function(
    List<XFile> files, {
    String? subject,
    String? text,
    Rect? sharePositionOrigin,
    List<String>? fileNameOverrides,
  }) runXFiles,
});

typedef UseShare = UseShareReturn Function();

const String _hookName = 'UseShare';

UseShareReturn useShareImpl() {
  final context = useContext();
  final ref = context as WidgetRef;

  final run = useCallback(
    (
      String text, {
      String? subject,
      Rect? sharePositionOrigin,
    }) {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#run',
          {
            'text': text,
            'subject': subject,
            'sharePositionOrigin': sharePositionOrigin,
          },
        ],
      );

      return Share.share(
        text,
        subject: subject,
        sharePositionOrigin: sharePositionOrigin,
      );
    },
    [],
  );
  final runXFiles = useCallback(
    (
      List<XFile> files, {
      String? subject,
      String? text,
      Rect? sharePositionOrigin,
      List<String>? fileNameOverrides,
    }) {
      ref.read(appLoggerProvider).i(
        [
          '$_hookName#runXFiles',
          {
            'files': files,
            'subject': subject,
            'text': text,
            'sharePositionOrigin': sharePositionOrigin,
            'fileNameOverrides': fileNameOverrides,
          },
        ],
      );

      return Share.shareXFiles(
        files,
        text: text,
        subject: subject,
        sharePositionOrigin: sharePositionOrigin,
      );
    },
    [],
  );

  return (run: run, runXFiles: runXFiles);
}

final UseShare useShare = useShareImpl;
