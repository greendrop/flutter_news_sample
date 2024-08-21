import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/setting_route_data_provider.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_news_sample/feature/setting/hook/use_go_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/logger.dart';
import '../../../support/widget/mock_go_router_provider.dart';
import '../../../support/widget/test_material_app.dart';

class MockSettingRouteData extends Mock implements SettingRouteData {}

void main() {
  group('useGoSettingPage', () {
    group('#run', () {
      testWidgets('SettingRouteData#goが呼ばれること', (tester) async {
        late UseGoSettingPageReturn goSettingPage;
        late BuildContext builderContext;

        final goRouter = MockGoRouter();
        final settingRouteData = MockSettingRouteData();

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              settingRouteDataProvider.overrideWithValue(settingRouteData),
            ],
            child: TestMaterialApp(
              child: MockGoRouterProvider(
                goRouter: goRouter,
                child: HookConsumer(
                  builder: (context, ref, child) {
                    goSettingPage = useGoSettingPage();
                    builderContext = context;
                    return Container();
                  },
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => settingRouteData.go(builderContext)).thenReturn(null);

        goSettingPage.run();
        await tester.pumpAndSettle();

        verify(() => settingRouteData.go(builderContext)).called(1);
      });
    });
  });
}
