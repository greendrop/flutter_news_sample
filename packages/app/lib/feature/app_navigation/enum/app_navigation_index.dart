enum AppNavigationIndex {
  newsArticleList(value: 0),
  newsArticleSearch(value: 1),
  setting(value: 2),
  ;

  const AppNavigationIndex({required this.value});

  final int value;

  static AppNavigationIndex fromValue(int value) {
    switch (value) {
      case 0:
        return AppNavigationIndex.newsArticleList;
      case 1:
        return AppNavigationIndex.newsArticleSearch;
      case 2:
        return AppNavigationIndex.setting;
      default:
        throw Exception('Invalid value');
    }
  }
}
