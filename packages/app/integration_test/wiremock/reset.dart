// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'wiremock_admin_mappings_client.dart';

Future<http.Response> resetMockApi() {
  return WireMockAdminMappingsClient().reset();
}
