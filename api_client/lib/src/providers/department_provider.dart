import 'package:api_client/src/api_client.dart';
import 'package:api_client/src/models/department.dart';

// void main() async {
//   final obj = DepartmentProvider();
//   final data = await obj.getAll();
//   print(data.map((e) => e));
// }

class DepartmentProvider {
  DepartmentProvider({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;

  Future<List<Department>> getAll() async {
    final List<dynamic> fromApi =
        await _apiClient.getAll('department/get_all.php');
    return fromApi.map((department) => Department.fromMap(department)).toList();
  }
}
