import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_logger/riverpod/app_logger.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/locale_setting_route_data_provider.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_news_sample/feature/locale_setting/hook/use_push_locale_setting_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/logger.dart';
import '../../../support/widget/mock_go_router_provider.dart';
import '../../../support/widget/test_material_app.dart';

class MockLocaleSettingRouteData extends Mock
    implements LocaleSettingRouteData {}

void main() {
  group('usePushLocaleSettingPage', () {
    group('#run', () {
      testWidgets('SettingRouteData#goが呼ばれること', (tester) async {
        late UsePushLocaleSettingPageReturn pushLocaleSettingPage;
        late BuildContext builderContext;

        final goRouter = MockGoRouter();
        final localeSettingRouteData = MockLocaleSettingRouteData();

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              appLoggerProvider.overrideWithValue(buildAppTestLogger()),
              localeSettingRouteDataProvider
                  .overrideWithValue(localeSettingRouteData),
            ],
            child: TestMaterialApp(
              child: MockGoRouterProvider(
                goRouter: goRouter,
                child: HookConsumer(
                  builder: (context, ref, child) {
                    pushLocaleSettingPage = usePushLocaleSettingPage();
                    builderContext = context;
                    return Container();
                  },
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => localeSettingRouteData.push<void>(builderContext))
            .thenAnswer((_) async {});

        await pushLocaleSettingPage.run();
        await tester.pumpAndSettle();

        verify(() => localeSettingRouteData.push<void>(builderContext))
            .called(1);
      });
    });
  });
}
