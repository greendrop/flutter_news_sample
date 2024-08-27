import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/news_article_search/widget/news_article_search_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../support/widget/test_material_app.dart';

void main() {
  group('NewsArticleSearchForm', () {
    testWidgets(
        [
          '入力フィールド、ボタンが表示されること',
          '初期値が設定されていること',
        ].join(', '), (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: NewsArticleSearchForm(initialKeyword: 'initialKeyword'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final keywordTextFieldFinder = find.descendant(
        of: find.byKey(const Key('NewsArticleSearchFormKeywordTextField')),
        matching: find.byType(TextField),
      );
      expect(keywordTextFieldFinder, findsOneWidget);

      final keywordTextField = tester.widget<TextField>(keywordTextFieldFinder);
      expect(keywordTextField.controller?.text, 'initialKeyword');

      final submitButtonFinder =
          find.byKey(const Key('NewsArticleSearchFormSubmitButton'));
      expect(submitButtonFinder, findsOneWidget);
    });

    testWidgets('submitボタンをタップして、onSubmitが呼ばれること', (tester) async {
      var onSubmitKeyword = '';

      await tester.pumpWidget(
        ProviderScope(
          child: TestMaterialApp(
            child: Scaffold(
              body: NewsArticleSearchForm(
                initialKeyword: 'initialKeyword',
                onSubmit: ({required String keyword}) {
                  onSubmitKeyword = keyword;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final keywordTextFieldFinder = find.descendant(
        of: find.byKey(const Key('NewsArticleSearchFormKeywordTextField')),
        matching: find.byType(TextField),
      );

      await tester.enterText(keywordTextFieldFinder, 'newKeyword');
      await tester.pumpAndSettle();

      await tester
          .tap(find.byKey(const Key('NewsArticleSearchFormSubmitButton')));
      await tester.pumpAndSettle();

      expect(onSubmitKeyword, 'newKeyword');
    });
  });
}
