import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/app_router/riverpod/news_article_detail_route_data.dart';
import 'package:flutter_news_sample/feature/app_router/route_data/app_route_data.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_push_news_article_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget/mock_go_router_provider.dart';
import '../../../support/widget/test_material_app.dart';

class MockNewsArticleDetailRouteData extends Mock
    implements NewsArticleDetailRouteData {
  MockNewsArticleDetailRouteData({
    required this.title,
    required this.url,
  });

  @override
  final String title;
  @override
  final String url;
}

void main() {
  group('usePushNewsArticleDetailPage', () {
    group('#run', () {
      testWidgets('NewsArticleDetailRouteData#pushが呼ばれること', (tester) async {
        late UsePushNewsArticleDetailPageReturn pushNewsArticleDetailPage;
        late BuildContext builderContext;

        final goRouter = MockGoRouter();
        final newsArticleDetailRouteData = MockNewsArticleDetailRouteData(
          title: 'dummy',
          url: 'https://example.com',
        );

        await tester.pumpWidget(
          TestMaterialApp(
            providerScopeOverrides: [
              newsArticleDetailRouteDataProvider(
                title: 'dummy',
                url: 'https://example.com',
              ).overrideWithValue(newsArticleDetailRouteData),
            ],
            child: MockGoRouterProvider(
              goRouter: goRouter,
              child: HookConsumer(
                builder: (context, ref, child) {
                  pushNewsArticleDetailPage = usePushNewsArticleDetailPage();
                  builderContext = context;
                  return Container();
                },
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        when(() => newsArticleDetailRouteData.push<void>(builderContext))
            .thenAnswer((_) async {});

        await pushNewsArticleDetailPage.run(
          title: 'dummy',
          url: 'https://example.com',
        );
        await tester.pumpAndSettle();

        verify(() => newsArticleDetailRouteData.push<void>(builderContext))
            .called(1);
      });
    });
  });
}
