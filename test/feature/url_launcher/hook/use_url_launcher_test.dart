import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/url_launcher/hook/use_url_launcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import '../../../support/logger.dart';
import '../../../support/widget/test_material_app.dart';

class MockUrlLauncherPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {}

class FakeLaunchOptions extends Fake implements LaunchOptions {}

void main() {
  late MockUrlLauncherPlatform mockUrlLauncherPlatform;

  setUp(() {
    mockUrlLauncherPlatform = MockUrlLauncherPlatform();
    UrlLauncherPlatform.instance = mockUrlLauncherPlatform;
    registerFallbackValue(FakeLaunchOptions());
  });

  group('useUrlLauncher', () {
    group('#canLaunchUrl', () {
      testWidgets('canLaunchが呼ばれること', (tester) async {
        late UseUrlLauncherReturn urlLauncher;

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
            ],
            child: TestMaterialApp(
              child: HookConsumer(
                builder: (context, ref, child) {
                  urlLauncher = useUrlLauncher();
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => mockUrlLauncherPlatform.canLaunch('https://example.com'))
            .thenAnswer((_) async => true);

        await urlLauncher.canLaunchUrl(Uri.parse('https://example.com'));

        verify(
          () => mockUrlLauncherPlatform.canLaunch('https://example.com'),
        ).called(1);
      });
    });

    group('#launchUrl', () {
      testWidgets('launchUrlが呼ばれること', (tester) async {
        late UseUrlLauncherReturn urlLauncher;

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
            ],
            child: TestMaterialApp(
              child: HookConsumer(
                builder: (context, ref, child) {
                  urlLauncher = useUrlLauncher();
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(
          () => mockUrlLauncherPlatform.launchUrl(
            'https://example.com',
            any(),
          ),
        ).thenAnswer((_) async => true);

        await urlLauncher.launchUrl(Uri.parse('https://example.com'));

        verify(
          () => mockUrlLauncherPlatform.launchUrl(
            'https://example.com',
            any(),
          ),
        ).called(1);
      });
    });
  });
}
