import '../models/chat.dart';
import '../repositories/chat_repositories.dart';

class chatService {
  chatService._internal();

  static final chatService _singleton = chatService._internal();

  factory chatService() {
    return _singleton;
  }

  Future connect({
    required String room,
  }) async {
    chatRepositories.instance.connect(
      room,
    );
  }

  Future sendMessage({
    required Chat chatParams,
  }) async {
    chatRepositories.instance.sendMessage(
      chatParams,
    );
  }

  Future broadCastNotification({
    required void Function(dynamic) onReceive,
  }) async {
    chatRepositories.instance.broadCastNotification(
      onReceive: onReceive,
    );
  }

  Future disconnect() async {
    chatRepositories.instance.disconnect();
  }

  Stream<dynamic> getStream() {
    return chatRepositories.instance.getStream();
  }

  Future close() async {
    chatRepositories.instance.disconnect();
  }
}
