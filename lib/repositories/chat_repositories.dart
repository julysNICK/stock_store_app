import 'dart:convert';

import 'package:web_socket_channel/io.dart';

import '../models/chat.dart';

class chatRepositories {
  late IOWebSocketChannel channel;
  chatRepositories._internal();

  static final chatRepositories _instance = chatRepositories._internal();

  static chatRepositories get instance => _instance;

  factory chatRepositories() => _instance;

  void connect(
    String room,
  ) {
    channel = IOWebSocketChannel.connect(
      'ws://192.168.0.69:8080/chat/$room',
      pingInterval: const Duration(seconds: 5),
    );
  }

  void disconnect() {
    channel.sink.close();
  }

  void sendMessage(
    Chat chatParams,
  ) {
    channel.sink.add(
      jsonEncode({
        "author": chatParams.author,
        "room": chatParams.room,
        "content": chatParams.content,
      }),
    );
  }

  Stream<dynamic> getStream() {
    return channel.stream;
  }

  Future broadCastNotification({
    required void Function(dynamic) onReceive,
  }) async {
    channel.stream.listen((event) {
      final Map<String, dynamic> data = jsonDecode(event);
      final message = Chat.fromJson(data);
      onReceive(message);
    });
  }
}
