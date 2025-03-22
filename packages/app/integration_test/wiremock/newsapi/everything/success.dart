import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../wiremock_admin_mappings_client.dart';

Future<http.Response> createNewsApiEverythingSuccessMockApi() {
  return WireMockAdminMappingsClient().createByJson({
    'request': {
      'method': 'GET',
      'urlPathPattern': '/newsapi/v2/everything',
      'queryParameters': {
        'apiKey': {'matches': '.*'},
        'q': {'matches': '.*'},
        'pageSize': {'matches': '.*'},
        'page': {'matches': '.*'},
      },
    },
    'response': {
      'status': 200,
      'headers': {
        'Content-Type': 'application/json',
      },
      'body': jsonEncode({
        'status': 'ok',
        'totalResults': 3,
        'articles': [
          {
            'source': {
              'id': 'source_1',
              'name': 'source_name_1',
            },
            'title': 'title_1',
            'description': 'description_1',
            'url': 'https://example.com',
          },
          {
            'source': {
              'id': 'source_2',
              'name': 'source_name_2',
            },
            'title': 'title_2',
            'description': 'description_2',
            'url': 'https://example.com',
          },
          {
            'source': {
              'id': 'source_3',
              'name': 'source_name_3',
            },
            'title': 'title_3',
            'description': 'description_3',
            'url': 'https://example.com',
          },
        ],
      }),
    },
  });
}
