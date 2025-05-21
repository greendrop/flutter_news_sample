import 'package:app/util/result.dart';
import 'package:app/util/share_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:share_plus_platform_interface/method_channel/method_channel_share.dart';
import 'package:share_plus_platform_interface/share_plus_platform_interface.dart';

class MockMethodChannelShare extends Mock
    with MockPlatformInterfaceMixin
    implements MethodChannelShare {}

void main() {
  late MockMethodChannelShare mockMethodChannelShare;

  setUp(() {
    mockMethodChannelShare = MockMethodChannelShare();
    SharePlatform.instance = mockMethodChannelShare;
  });

  group('ShareHandler', () {
    group('#share', () {
      testWidgets('SharePlus#shareが呼ばれ、Okが返すこと', (tester) async {
        final shareHandler = ShareHandler();
        final shareParams = ShareParams(text: 'Share text');
        const shareResult = ShareResult('', ShareResultStatus.success);

        when(
          () => mockMethodChannelShare.share(shareParams),
        ).thenAnswer((_) async => shareResult);

        final result = await shareHandler.share(shareParams);

        verify(() => mockMethodChannelShare.share(shareParams)).called(1);

        expect(result, isA<Ok<ShareResult>>());
        expect((result as Ok<ShareResult>).value, shareResult);
      });
    });
  });
}
