import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web_socket_channel/io.dart';

import '../models/chat.dart';
import '../models/store.dart';

class chatRepositories {
  final storage = const FlutterSecureStorage();
  late IOWebSocketChannel channel;
  chatRepositories._internal();

  static final chatRepositories _instance = chatRepositories._internal();

  static chatRepositories get instance => _instance;

  factory chatRepositories() => _instance;

  Future channelconnect(
    List<dynamic> mensagens,
    void Function(void Function() fn) setState,
    String idRoom,
  ) async {
    try {
      Map<String, String> allValues = await storage.readAll();

      final decodeJsonStore = jsonDecode(allValues['token']!);

      final loginJson = Login_store.fromJson(decodeJsonStore);

      channel = IOWebSocketChannel.connect(
        'ws://192.168.0.69:8080/chat/$idRoom',
        pingInterval: const Duration(seconds: 5),
      );
      channel.stream.listen((event) {
        print("event");
        print(event);
        print("-----------------------");
        var jsonEvent = jsonDecode(event);

        if (jsonEvent["author"] != loginJson.store.name) {
          print("aqui no author");
          setState(() {
            mensagens.add(
              {
                "author": jsonEvent["author"],
                "room": jsonEvent["room"],
                "content": jsonEvent["content"],
                "isMe": false,
              },
            );
          });
        }
      });
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<void> sendMessage(String message) async {
    channel.sink.add(
      jsonEncode({
        "author": "1",
        "room": "1",
        "content": message,
        "isMe": true,
      }),
    );
  }

  Future<void> sendMessageS(
    List<dynamic> mensagens,
    void Function(void Function() fn) setState,
    Chat chatParams,
  ) async {
    setState(() {
      mensagens.add({
        "author": chatParams.author,
        "room": chatParams.room,
        "content": chatParams.content,
        "isMe": true,
      });
    });

    channel.sink.add(
      jsonEncode({
        "author": chatParams.author,
        "room": chatParams.room,
        "content": chatParams.content,
        "isMe": true,
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
