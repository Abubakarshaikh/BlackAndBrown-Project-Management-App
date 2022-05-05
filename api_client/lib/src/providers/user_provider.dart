import 'package:api_client/api_client.dart';

class UserProvider {
  UserProvider({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;
  Future<User> getUserbyToken(String token) async {
    final fromApi = await _apiClient.getByToken(token);
    return User.fromMap(fromApi);
  }
}
