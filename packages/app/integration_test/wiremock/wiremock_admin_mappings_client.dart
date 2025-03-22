import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../config/integration_test_config.dart';

class WireMockAdminMappingsClient {
  WireMockAdminMappingsClient();

  String get _wireMockAdminMappingsUrl =>
      '${IntegrationTestConfig.instance.wireMockBaseUrl}/__admin/mappings';

  Future<http.Response> reset() async {
    return http.post(
      Uri.parse('$_wireMockAdminMappingsUrl/reset'),
    );
  }

  Future<http.Response> createByJson(Map<String, dynamic> jsonData) async {
    return http.post(
      Uri.parse(_wireMockAdminMappingsUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(jsonData),
    );
  }
}
