import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_log_detail/hook/use_push_app_log_detail_page.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/app_log_detail_route_data.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget/mock_go_router_provider.dart';
import '../../../support/widget/test_material_app.dart';

class MockAppLogDetailRouteData extends Mock implements AppLogDetailRouteData {
  MockAppLogDetailRouteData({
    required this.filename,
  });

  @override
  final String filename;
}

void main() {
  group('usePushAppLogDetailPage', () {
    group('#run', () {
      testWidgets('AppLogDetailRouteData#pushが呼ばれること', (tester) async {
        late UsePushAppLogDetailPageReturn pushAppLogDetailPage;
        late BuildContext builderContext;

        final goRouter = MockGoRouter();
        final appLogDetailRouteData =
            MockAppLogDetailRouteData(filename: 'dummy');

        await tester.pumpWidget(
          TestMaterialApp(
            providerScopeOverrides: [
              appLogDetailRouteDataProvider(filename: 'dummy')
                  .overrideWithValue(appLogDetailRouteData),
            ],
            child: MockGoRouterProvider(
              goRouter: goRouter,
              child: HookConsumer(
                builder: (context, ref, child) {
                  pushAppLogDetailPage = usePushAppLogDetailPage();
                  builderContext = context;
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => appLogDetailRouteData.push<void>(builderContext))
            .thenAnswer((_) async {});

        await pushAppLogDetailPage.run(filename: 'dummy');
        await tester.pumpAndSettle();

        verify(() => appLogDetailRouteData.push<void>(builderContext))
            .called(1);
      });
    });
  });
}
