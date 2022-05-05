import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RequestFailure implements Exception {}

class NotFoundFailure implements Exception {}

class ApiClient {
  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const String _baseUrl = "10.0.2.2:8000";
  final http.Client _httpClient;

  Future<List<dynamic>> getAll(String fileName) async {
    final request =
        Uri.https(_baseUrl, '/web/projects/rest_api/api/department/$fileName');
    final response = await _httpClient.get(request);
    log('-------------------------${response}');

    if (response.statusCode != 200) {
      throw RequestFailure();
    }
    final responseJson = jsonDecode(
      response.body,
    ) as List;
    if (responseJson.isEmpty) {
      throw NotFoundFailure();
    }

    return responseJson;
  }

  Future<Map<String, dynamic>> getById({String? path, int? id}) async {
    return {};
  }

  Future<void> save({String? path, Map<String, dynamic>? data}) async {}
  Future<void> update({String? path, Map<String, dynamic>? data}) async {}
  Future<void> delete({String? path, int? id}) async {}
}
