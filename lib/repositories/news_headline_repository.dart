// Package imports:
import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';

// Project imports:
import 'package:flutter_news_sample/config/app_config.dart';

class NewsHeadlineRepository {
  final _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<http.Response> fetch({
    required String category,
    int page = 1,
  }) async {
    final appConfig = AppConfig();
    final uriBuilder = UriBuilder.fromUri(Uri.parse(_baseUrl))
      ..queryParameters['apiKey'] = appConfig.newsApiKey
      ..queryParameters['country'] = 'jp'
      ..queryParameters['category'] = category
      ..queryParameters['pageSize'] = '100'
      ..queryParameters['page'] = page.toString();

    return http.get(uriBuilder.build());
  }
}
