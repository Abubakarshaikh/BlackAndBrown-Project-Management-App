import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RequestFailure implements Exception {}

class NotFoundFailure implements Exception {}

class ApiClient {
  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final String _baseUrl = 'www.bbit-sol.com';

  Future<List<dynamic>> getAll(String path, {int? id}) async {
    final request = Uri.http(_baseUrl, '/apps/monday/api/$path');
    final response = await _httpClient.get(request);

    log("---------${response.body}-------");
    if (response.statusCode != 200) {
      throw RequestFailure;
    }
    final List<dynamic> fromJson = json.decode(response.body) as List<dynamic>;

    if (fromJson.isEmpty) {
      throw NotFoundFailure;
    }

    return fromJson;
  }

  Future<List<dynamic>> getAllById(String path, int id) async {
    final request =
        Uri.parse("https://bbit-sol.com/apps/monday/api/$path?id=$id");
    final response = await _httpClient.get(request);

    if (response.statusCode != 200) {
      throw RequestFailure;
    }
    final List<dynamic> fromJson = json.decode(response.body) as List<dynamic>;

    if (fromJson.isEmpty) {
      throw NotFoundFailure;
    }

    return fromJson;
  }

  Future<dynamic> getByToken(String token) async {
    final request = Uri.http(_baseUrl, '/apps/monday/api/auth/is_login.php');
    final response =
        await _httpClient.post(request, body: json.encode({"token": token}));

    if (response.statusCode != 200) {
      throw RequestFailure;
    }

    final fromJson = json.decode(response.body);

    if (fromJson.isEmpty) {
      throw NotFoundFailure;
    }

    return fromJson;
  }

  Future<void> save(String data, String path) async {
    final request = Uri.http(_baseUrl, '/apps/monday/api/$path');
    final response = await _httpClient.post(request, body: data);

    if (response.statusCode != 200) {
      throw RequestFailure;
    }
  }

  Future<void> update(String path, String body) async {
    final request = Uri.http(_baseUrl, '/web/projects/rest_api/api/$path');
    final response = await _httpClient.put(request, body: body);

    if (response.statusCode != 200) {
      throw RequestFailure();
    }

    log("---${response.body}---");
  }

  Future<void> loginByEmailAndPassword(String data, String path) async {
    log("--------------${data}");
    final request = Uri.http(_baseUrl, '/apps/monday/api/$path');
    final response = await _httpClient.post(request, body: data);

    if (response.statusCode != 200) {
      throw RequestFailure;
    }
    print("---------${json.decode(response.body)}--------");
  }
}
