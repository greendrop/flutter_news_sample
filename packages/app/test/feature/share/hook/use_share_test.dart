import 'package:app/feature/share/hook/use_share.dart';
import 'package:app/riverpod/share_handler.dart';
import 'package:app/util/result.dart';
import 'package:app/util/share_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget/test_material_app.dart';

class MockShareHandler extends Mock implements ShareHandler {}

void main() {
  group('useShare', () {
    group('#run', () {
      testWidgets('ShareHandler#shareが呼ばれ、Okを返すこと', (tester) async {
        late UseShareReturn share;
        final mockShareHandler = MockShareHandler();
        final shareParams = ShareParams(text: 'Share text');
        const shareResult = ShareResult('', ShareResultStatus.success);

        await tester.pumpWidget(
          TestMaterialApp(
            providerScopeOverrides: [
              shareHandlerProvider.overrideWithValue(mockShareHandler),
            ],
            child: HookConsumer(
              builder: (context, ref, child) {
                share = useShare();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(
          () => mockShareHandler.share(shareParams),
        ).thenAnswer((_) async => const Result.ok(shareResult));

        final result = await share.run(shareParams);

        verify(() => mockShareHandler.share(shareParams)).called(1);

        expect(result, isA<Ok<ShareResult>>());
        expect((result as Ok<ShareResult>).value, shareResult);
      });
    });
  });
}
