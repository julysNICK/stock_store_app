import '../models/chat.dart';
import '../repositories/chat_repositories.dart';

class chatService {
  chatService._internal();

  static final chatService _singleton = chatService._internal();

  factory chatService() {
    return _singleton;
  }

  Future connect(
    List<dynamic> mensagens,
    void Function(void Function()) setState,
    String idRoom,
  ) async {
    chatRepositories.instance.channelconnect(
      mensagens,
      setState,
      idRoom,
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
    Chat? chatParams,
  }) async {
    chatRepositories.instance.sendMessageS(mensagens, setState, chatParams!);
  }
}
