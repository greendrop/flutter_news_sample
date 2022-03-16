// Package imports:
import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';

// Project imports:
import 'package:flutter_news_sample/config/app_config.dart';

class NewsSearchRepository {
  final _baseUrl = 'https://newsapi.org/v2/everything';

  Future<http.Response> fetch({
    required String keyword,
    int page = 1,
  }) async {
    final appConfig = AppConfig();
    final uriBuilder = UriBuilder.fromUri(Uri.parse(_baseUrl))
      ..queryParameters['apiKey'] = appConfig.newsApiKey
      ..queryParameters['q'] = keyword
      ..queryParameters['pageSize'] = '100'
      ..queryParameters['page'] = page.toString();

    return http.get(uriBuilder.build());
  }
}
