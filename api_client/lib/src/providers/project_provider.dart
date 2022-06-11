import 'package:api_client/src/models/project.dart';
import '../api_client.dart';

class ProjectProvider {
  ProjectProvider({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;

  Future<List<Project>> getAll(int id) async {
    final List<dynamic> fromApi =
        await _apiClient.getAllById('project/get_all.php', id);
    return fromApi.map((project) => Project.fromMap(project)).toList();
  }

  Future<void> save(String data) async {
    await _apiClient.save(data, 'project/save.php');
  }

  // Future<void> update(String data, int id) async {
  //   await _apiClient.update(data, 'project/save.php', id);
  // }
}
