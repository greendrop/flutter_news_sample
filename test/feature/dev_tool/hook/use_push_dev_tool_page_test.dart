import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/dev_tool_route_data.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_news_sample/feature/dev_tool/hook/use_push_dev_tool_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget/mock_go_router_provider.dart';
import '../../../support/widget/test_material_app.dart';

class MockDevToolRouteData extends Mock implements DevToolRouteData {}

void main() {
  group('usePushDevToolPage', () {
    group('#run', () {
      testWidgets('DevToolRouteData#goが呼ばれること', (tester) async {
        late UsePushDevToolPageReturn pushDevToolPage;
        late BuildContext builderContext;

        final goRouter = MockGoRouter();
        final devToolRouteData = MockDevToolRouteData();

        await tester.pumpWidget(
          TestMaterialApp(
            providerScopeOverrides: [
              devToolRouteDataProvider.overrideWithValue(devToolRouteData),
            ],
            child: MockGoRouterProvider(
              goRouter: goRouter,
              child: HookConsumer(
                builder: (context, ref, child) {
                  pushDevToolPage = usePushDevToolPage();
                  builderContext = context;
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => devToolRouteData.push<void>(builderContext))
            .thenAnswer((_) async {});

        await pushDevToolPage.run();
        await tester.pumpAndSettle();

        verify(() => devToolRouteData.push<void>(builderContext)).called(1);
      });
    });
  });
}
