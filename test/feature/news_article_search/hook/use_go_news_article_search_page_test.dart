import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/news_article_search_route_data.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_news_sample/feature/news_article_search/hook/use_go_news_article_search_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget/mock_go_router_provider.dart';
import '../../../support/widget/test_material_app.dart';

class MockNewsArticleSearchRouteData extends Mock
    implements NewsArticleSearchRouteData {}

void main() {
  group('useGoNewsArticleSearchPage', () {
    group('#run', () {
      testWidgets('NewsArticleSearchRouteData#goが呼ばれること', (tester) async {
        late UseGoNewsArticleSearchPageReturn goNewsArticleSearchPage;
        late BuildContext builderContext;

        final goRouter = MockGoRouter();
        final newsArticleSearchRouteData = MockNewsArticleSearchRouteData();

        await tester.pumpWidget(
          TestMaterialApp(
            providerScopeOverrides: [
              newsArticleSearchRouteDataProvider
                  .overrideWithValue(newsArticleSearchRouteData),
            ],
            child: MockGoRouterProvider(
              goRouter: goRouter,
              child: HookConsumer(
                builder: (context, ref, child) {
                  goNewsArticleSearchPage = useGoNewsArticleSearchPage();
                  builderContext = context;
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => newsArticleSearchRouteData.go(builderContext))
            .thenAnswer((_) async {});

        goNewsArticleSearchPage.run();
        await tester.pumpAndSettle();

        verify(() => newsArticleSearchRouteData.go(builderContext)).called(1);
      });
    });
  });
}
