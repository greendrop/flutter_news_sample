import 'package:flutter_news_sample/feature/not_found/widget/not_found_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('NotFoundPage', () {
    testWidgets('Not Foundが表示されること', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          const TestMaterialApp(
            child: NotFoundPage(),
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(find.text('Not Found'), findsOneWidget);
    });
  });
}
