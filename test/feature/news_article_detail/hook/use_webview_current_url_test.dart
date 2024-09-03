import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_current_url.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('useWebViewCurrentUrl', () {
    group('#setState', () {
      testWidgets('stateが更新されること', (tester) async {
        late UseWebViewCurrentUrlReturn webViewCurrentUrl;

        await tester.pumpWidget(
          TestMaterialApp(
            child: HookConsumer(
              builder: (context, ref, child) {
                webViewCurrentUrl = useWebViewCurrentUrl();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        webViewCurrentUrl.setState('https://example.com');
        await tester.pumpAndSettle();
        expect(webViewCurrentUrl.state, 'https://example.com');
      });
    });
  });
}
