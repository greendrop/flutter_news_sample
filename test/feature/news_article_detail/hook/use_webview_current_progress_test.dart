import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_detail/hook/use_webview_current_progress.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('useWebViewCurrentProgress', () {
    group('#setState', () {
      testWidgets('stateが更新されること', (tester) async {
        late UseWebViewCurrentProgressReturn webViewCurrentProgress;

        await tester.pumpWidget(
          TestMaterialApp(
            child: HookConsumer(
              builder: (context, ref, child) {
                webViewCurrentProgress = useWebViewCurrentProgress();
                return Container();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();

        webViewCurrentProgress.setState(50);
        await tester.pumpAndSettle();
        expect(webViewCurrentProgress.state, 50);
      });
    });
  });
}
