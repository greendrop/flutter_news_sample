// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';

// Project imports:
import 'package:flutter_news_sample/config/app_config.dart';
import 'package:flutter_news_sample/entities/news_article.dart';

class NewsHeadlineRepository {
  final _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<List<NewsArticle>> fetch({
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

    final response = await http.get(uriBuilder.build());

    if (response.statusCode != 200) {
      return Future<List<NewsArticle>>.error(
        Exception('HTTP Error status=${response.statusCode}'),
      );
    }

    final newsArticles = <NewsArticle>[];
    final decoded = json.decode(response.body) as Map<String, dynamic>;
    if (decoded.containsKey('articles')) {
      for (final Map<String, dynamic> item in decoded['articles']) {
        final newsArticle = NewsArticle(
          title: item.containsKey('title') && item['title'] != null
              ? item['title'].toString()
              : null,
          url: item.containsKey('url') && item['url'] != null
              ? item['url'].toString()
              : null,
          imageUrl: item.containsKey('urlToImage') && item['urlToImage'] != null
              ? item['urlToImage'].toString()
              : null,
        );
        newsArticles.add(newsArticle);
      }
    }

    return Future<List<NewsArticle>>.value(newsArticles);
  }
}
