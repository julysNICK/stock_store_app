import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/chat.dart';
import '../../../service/chat_service.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChatConnect>((event, emit) async {
      print('ChatConnect');
      emit(ChatLoading());
      try {
        await chatService().connect(
          room: event.room,
        );
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
        await chatService().sendMessage(
            chatParams: Chat(author: "12", room: "12", content: "12"));

        // chatService().broadCastNotification(
        //   onReceive: (data) {
        //     print("aqui");

        //     print(data);
        //     // emit(ChatLoaded(
        //     //     chat: jsonDecode(
        //     //   Chat.fromJson(data).toString(),
        //     // )));
        //   },
        // );

        // emit(ChatInitial());
      } catch (e) {
        print(e);
        emit(ChatError());
      }
    });
  }
}
