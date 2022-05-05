import 'package:api_client/api_client.dart';

class MessageProvider {
  MessageProvider({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;

  Future<List<Message>> getAllMessages(int id) async {
    final List<dynamic> fromApi =
        await _apiClient.getAllById("message/get_all.php", id);

    return fromApi.map((message) => Message.fromMap(message)).toList();
  }

  Future<void> saveMessage(Message message) async {
    await _apiClient.save(message.toJson(), 'message/save.php');
  }
}
