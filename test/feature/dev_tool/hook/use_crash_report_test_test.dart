import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/dev_tool/hook/use_crash_report_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('UseCrashReportTest', () {
    group('#run', () {
      testWidgets('例外が発生すること', (tester) async {
        late UseCrashReportTestReturn crashReportTest;

        await tester.pumpWidget(
          TestMaterialApp(
            child: HookConsumer(
              builder: (context, ref, child) {
                crashReportTest = useCrashReportTest();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          () => crashReportTest.run(),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'toString()',
              'Exception: Crash Report Test',
            ),
          ),
        );
      });
    });
  });
}
