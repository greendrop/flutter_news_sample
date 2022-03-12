class AppConfig {
  factory AppConfig() => _instance;
  AppConfig._internal();

  static final AppConfig _instance = AppConfig._internal();

  String newsApiKey = '';

  Future<void> load() async {
    newsApiKey = const String.fromEnvironment('NEWS_API_KEY');
  }
}
