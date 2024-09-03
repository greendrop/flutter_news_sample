import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_request_go_back.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('useWebViewRequestGoBack', () {
    group('#setState', () {
      testWidgets('stateが更新されること', (tester) async {
        late UseWebViewRequestGoBackReturn webViewRequestGoBack;

        await tester.pumpWidget(
          TestMaterialApp(
            child: HookConsumer(
              builder: (context, ref, child) {
                webViewRequestGoBack = useWebViewRequestGoBack();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        webViewRequestGoBack.setState(true);
        await tester.pumpAndSettle();
        expect(webViewRequestGoBack.state, true);

        webViewRequestGoBack.setState(false);
        await tester.pumpAndSettle();
        expect(webViewRequestGoBack.state, false);
      });
    });
  });
}
