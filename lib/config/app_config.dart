class AppConfig {
  factory AppConfig() => _instance;
  AppConfig._internal();

  static final AppConfig _instance = AppConfig._internal();

  String newsApiKey = '';
  List<String> newsHeadlineCategories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  Future<void> load() async {
    newsApiKey = const String.fromEnvironment('NEWS_API_KEY');
  }
}
