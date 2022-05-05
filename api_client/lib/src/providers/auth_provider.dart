import 'package:api_client/api_client.dart';



class AuthProvider {
  AuthProvider({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;
  Future<void> login(String data) async {
    await _apiClient.loginByEmailAndPassword(data,'auth/login.php');
  }
}
