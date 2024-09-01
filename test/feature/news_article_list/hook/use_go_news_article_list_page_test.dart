import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/news_article_list_route_data.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_news_sample/feature/news_article_list/hook/use_go_news_article_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget/mock_go_router_provider.dart';
import '../../../support/widget/test_material_app.dart';

class MockNewsArticleListRouteData extends Mock
    implements NewsArticleListRouteData {
  MockNewsArticleListRouteData({this.category});

  @override
  final String? category;
}

void main() {
  group('useGoNewsArticleListPage', () {
    group('#run', () {
      testWidgets('NewsArticleListRouteData#goが呼ばれること', (tester) async {
        late UseGoNewsArticleListPageReturn goNewsArticleListPage;
        late BuildContext builderContext;

        final goRouter = MockGoRouter();
        final newsArticleListRouteData = MockNewsArticleListRouteData();

        await tester.pumpWidget(
          TestMaterialApp(
            providerScopeOverrides: [
              newsArticleListRouteDataProvider(category: null)
                  .overrideWithValue(newsArticleListRouteData),
            ],
            child: MockGoRouterProvider(
              goRouter: goRouter,
              child: HookConsumer(
                builder: (context, ref, child) {
                  goNewsArticleListPage = useGoNewsArticleListPage();
                  builderContext = context;
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => newsArticleListRouteData.go(builderContext))
            .thenAnswer((_) async {});

        goNewsArticleListPage.run();
        await tester.pumpAndSettle();

        verify(() => newsArticleListRouteData.go(builderContext)).called(1);
      });
    });
  });
}
