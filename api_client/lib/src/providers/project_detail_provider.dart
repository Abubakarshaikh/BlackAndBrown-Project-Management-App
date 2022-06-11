import 'dart:developer';

import '../../api_client.dart';

class ProjectDetailProvider {
  ProjectDetailProvider({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;

  Future<ProjectDetail> readSingle(int id) async {
    final Map<String, dynamic> fromApi =
        await _apiClient.readSingle('project/get_by_id.php', id);
    log("readsingle: ${fromApi}");
    return ProjectDetail.fromMap(fromApi);
  }

  Future<void> update(String data, id) async {
    log("-----Provider: $data-----");
    await _apiClient.update('project/update.php', data, id);
  }
}
