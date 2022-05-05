import 'dart:developer';

import 'package:api_client/api_client.dart';

class AddProvider {
  AddProvider({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;
  Future<void> save(String data) async {
    log("############${data}############");
    await _apiClient.save(data, 'project/save.php');
  }
}
