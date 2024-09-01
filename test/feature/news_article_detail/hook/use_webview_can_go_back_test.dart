import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_can_go_back.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('useWebViewCanGoBack', () {
    group('#setState', () {
      testWidgets('stateが更新されること', (tester) async {
        late UseWebViewCanGoBackReturn webViewCanGoBack;

        await tester.pumpWidget(
          TestMaterialApp(
            child: HookConsumer(
              builder: (context, ref, child) {
                webViewCanGoBack = useWebViewCanGoBack();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        webViewCanGoBack.setState(true);
        await tester.pumpAndSettle();
        expect(webViewCanGoBack.state, true);

        webViewCanGoBack.setState(false);
        await tester.pumpAndSettle();
        expect(webViewCanGoBack.state, false);
      });
    });
  });
}
