import '../models/chat.dart';
import '../repositories/chat_repositories.dart';

class chatService {
  chatService._internal();

  static final chatService _singleton = chatService._internal();

  factory chatService() {
    return _singleton;
  }

  Future connect(
      List<dynamic> mensagens, void Function(void Function()) setState) async {
    chatRepositories.instance.channelconnect(
      mensagens,
      setState,
    );
  }

  Future sendMessage({
    required Chat chatParams,
  }) async {
    chatRepositories.instance.sendMessage("oi");
  }

  Future sendMessageS({
    required List<dynamic> mensagens,
    required void Function(void Function()) setState,
  }) async {
    chatRepositories.instance.sendMessageS(mensagens, setState);
  }
}
