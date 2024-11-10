class IntegrationTestConfig {
  factory IntegrationTestConfig() => instance;
  IntegrationTestConfig._internal() {
    wireMockBaseUrl = const String.fromEnvironment('wireMockBaseUrl');
  }

  static final IntegrationTestConfig instance =
      IntegrationTestConfig._internal();

  String wireMockBaseUrl = '';
}
