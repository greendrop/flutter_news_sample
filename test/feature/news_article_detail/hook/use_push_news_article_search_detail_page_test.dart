import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/news_article_search_detail_route_data.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_search_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget/mock_go_router_provider.dart';
import '../../../support/widget/test_material_app.dart';

class MockNewsArticleSearchDetailRouteData extends Mock
    implements NewsArticleSearchDetailRouteData {
  MockNewsArticleSearchDetailRouteData({
    required this.title,
    required this.url,
  });

  @override
  final String title;
  @override
  final String url;
}

void main() {
  group('usePushNewsArticleSearchDetailPage', () {
    group('#run', () {
      testWidgets('NewsArticleSearchDetailRouteData#pushが呼ばれること',
          (tester) async {
        late UsePushNewsArticleSearchDetailPageReturn
            pushNewsArticleSearchDetailPage;
        late BuildContext builderContext;

        final goRouter = MockGoRouter();
        final newsArticleSearchDetailRouteData =
            MockNewsArticleSearchDetailRouteData(
          title: 'dummy',
          url: 'https://example.com',
        );

        await tester.pumpWidget(
          TestMaterialApp(
            providerScopeOverrides: [
              newsArticleSearchDetailRouteDataProvider(
                title: 'dummy',
                url: 'https://example.com',
              ).overrideWithValue(newsArticleSearchDetailRouteData),
            ],
            child: MockGoRouterProvider(
              goRouter: goRouter,
              child: HookConsumer(
                builder: (context, ref, child) {
                  pushNewsArticleSearchDetailPage =
                      usePushNewsArticleSearchDetailPage();
                  builderContext = context;
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => newsArticleSearchDetailRouteData.push<void>(builderContext))
            .thenAnswer((_) async {});

        await pushNewsArticleSearchDetailPage.run(
          title: 'dummy',
          url: 'https://example.com',
        );
        await tester.pumpAndSettle();

        verify(
          () => newsArticleSearchDetailRouteData.push<void>(builderContext),
        ).called(1);
      });
    });
  });
}
