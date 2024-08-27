import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/share/hook/use_share.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:share_plus_platform_interface/method_channel/method_channel_share.dart';
import 'package:share_plus_platform_interface/share_plus_platform_interface.dart';

import '../../../support/widget/test_material_app.dart';

class MockMethodChannelShare extends Mock
    with MockPlatformInterfaceMixin
    implements MethodChannelShare {}

void main() {
  late MockMethodChannelShare mockMethodChannelShare;

  setUp(() {
    mockMethodChannelShare = MockMethodChannelShare();
    SharePlatform.instance = mockMethodChannelShare;
  });

  group('useShare', () {
    group('#run', () {
      testWidgets('Share.shareが呼ばれること', (tester) async {
        late UseShareReturn share;

        await tester.pumpWidget(
          TestMaterialApp(
            child: HookConsumer(
              builder: (context, ref, child) {
                share = useShare();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => mockMethodChannelShare.share('Share text')).thenAnswer(
          (_) async => const ShareResult('', ShareResultStatus.success),
        );

        await share.run('Share text');

        verify(
          () => mockMethodChannelShare.share('Share text'),
        ).called(1);
      });
    });
  });
}
