import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// ignore: depend_on_referenced_packages
import 'package:leak_tracker_flutter_testing/leak_tracker_flutter_testing.dart';
// ignore: depend_on_referenced_packages
import 'package:test_api/scaffolding.dart' as test_package;

void integrationTestWidgets(
  String description,
  IntegrationTestWidgetsFlutterBinding binding,
  WidgetTesterCallback callback, {
  bool? skip,
  test_package.Timeout? timeout,
  bool semanticsEnabled = true,
  TestVariant<Object?> variant = const DefaultTestVariant(),
  dynamic tags,
  int? retry,
  LeakTesting? experimentalLeakTesting,
}) {
  testWidgets(
    description,
    (tester) async {
      try {
        await callback(tester);
      } catch (error, stackTrace) {
        if (Platform.isAndroid) {
          await tester.pumpAndSettle();
          await binding.convertFlutterSurfaceToImage();
          await tester.pumpAndSettle();
        }

        // スタックトレースから 'integration_test/test' が含まれる行を探す
        final baseDir = 'integration_test/test';
        final traceLines = stackTrace.toString().split('\n');
        final targetLine = traceLines.firstWhere(
          (line) => line.contains(baseDir),
          orElse: () => '',
        );

        if (targetLine.isNotEmpty) {
          // ターゲット行から相対パスを抽出
          final relativePath =
              targetLine.split(baseDir).last.substring(1).replaceAll(')', '');

          // スクリーンショットを取得
          await binding.takeScreenshot(relativePath);
        } else {
          // ターゲット行が見つからない場合、description を使用してスクリーンショットを取得
          await binding.takeScreenshot(description);
        }

        rethrow;
      }
    },
    skip: skip,
    timeout: timeout,
    semanticsEnabled: semanticsEnabled,
    variant: variant,
    tags: tags,
    retry: retry,
    experimentalLeakTesting: experimentalLeakTesting,
  );
}
