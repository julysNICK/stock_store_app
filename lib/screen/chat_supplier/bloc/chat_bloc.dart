import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:stock_store/models/store.dart';

import '../../../models/chat.dart';
import '../../../service/chat_service.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    const storage = FlutterSecureStorage();
    on<ChatEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChatConnect>((event, emit) async {
      print('ChatConnect');
      emit(ChatLoading());
      try {
        await chatService()
            .connect(event.mensagens, event.setState, event.idRoom);
        emit(ChatConnected());
      } catch (e) {
        print(e);
        emit(ChatError());
      }
    });

    on<ChatLoad>((event, emit) async {
      print('ChatLoad');
      emit(ChatLoading());
      try {
        final chatAll;
        Map<String, String> allValues = await storage.readAll();

        await chatService().sendMessage(
            chatParams: Chat(
                author: event.author,
                room: event.IdSender,
                content: event.message));
      } catch (e) {
        print(e);
        emit(ChatError());
      }
    });

    on<ChatMenssagemAddEvent>(
      (event, emit) async {
        try {
          final chatAll;
          Map<String, String> allValues = await storage.readAll();

          final decodeJsonStore = jsonDecode(allValues['token']!);

          final loginJson = Login_store.fromJson(decodeJsonStore);

          await chatService().sendMessageS(
              mensagens: event.mensagens,
              chatParams: Chat(
                  author: loginJson.store.name,
                  room: loginJson.store.id.toString(),
                  content: event.message),
              setState: event.setState);

          emit(ChatMenssagemAdd(mensagens: event.mensagens));
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
