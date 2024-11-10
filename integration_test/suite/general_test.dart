import '../test/locale_setting_test.dart' as locale_setting_test;
import '../test/news_article_search_test.dart' as news_article_search_test;
import '../test/news_article_test.dart' as news_article_test;
import '../test/theme_setting_test.dart' as theme_setting_test;

void main() {
  news_article_test.main();
  news_article_search_test.main();
  locale_setting_test.main();
  theme_setting_test.main();
}
