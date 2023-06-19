import 'dart:convert';

import 'package:web_socket_channel/io.dart';

class chatRepositories {
  late IOWebSocketChannel channel;
  chatRepositories._internal();

  static final chatRepositories _instance = chatRepositories._internal();

  static chatRepositories get instance => _instance;

  factory chatRepositories() => _instance;

  Future channelconnect(List<dynamic> mensagens,
      void Function(void Function() fn) setState) async {
    try {
      channel = IOWebSocketChannel.connect(
        'ws://192.168.0.69:8080/chat/1',
        pingInterval: const Duration(seconds: 5),
      );
      channel.stream.listen((event) {
        var jsonEvent = jsonDecode(event);
        mensagens.add(jsonEvent);
      });
    } catch (e) {
      return throw Exception('Failed to load products');
    }
  }

  Future<void> sendMessage(String message) async {
    channel.sink.add(
      jsonEncode({
        "author": "1",
        "room": "1",
        "content": message,
      }),
    );
  }

  Future<void> sendMessageS(List<dynamic> mensagens,
      void Function(void Function() fn) setState) async {
    setState(() {
      mensagens.add({
        "author": "1",
        "room": "1",
        "content": "lorem lorem lorem",
      });
    });

    channel.sink.add(
      jsonEncode({
        "author": "1",
        "room": "1",
        "content": "lorem lorem lorem",
      }),
    );
  }

  // void connect(
  //   String room,
  // ) {
  //   channel = IOWebSocketChannel.connect(
  //     'ws://192.168.0.69:8080/chat/$room',
  //     pingInterval: const Duration(seconds: 5),
  //   );
  // }

  // void disconnect() {
  //   channel.sink.close();
  // }

  // void sendMessage(
  //   Chat chatParams,
  // ) {
  //   channel.sink.add(
  //     jsonEncode({
  //       "author": chatParams.author,
  //       "room": chatParams.room,
  //       "content": chatParams.content,
  //     }),
  //   );
  // }

  // Stream<dynamic> getStream() {
  //   return channel.stream;
  // }

  // Future broadCastNotification({
  //   required void Function(dynamic) onReceive,
  // }) async {
  //   channel.stream.listen((event) {
  //     final Map<String, dynamic> data = jsonDecode(event);
  //     final message = Chat.fromJson(data);
  //     onReceive(message);
  //   });
  // }
}
