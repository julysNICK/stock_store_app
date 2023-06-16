part of 'chat_bloc.dart';

@immutable
abstract class ChatState {
  Chat? chat;

  ChatState({this.chat});
}

class ChatInitial extends ChatState {
  ChatInitial() : super();

  @override
  String toString() => 'ChatInitial';
}

class ChatLoading extends ChatState {
  ChatLoading();
}

class ChatConnected extends ChatState {
  ChatConnected();
}

class ChatLoaded extends ChatState {
  ChatLoaded({required Chat chat}) : super(chat: chat);

  @override
  String toString() => 'ChatLoaded';
}

class ChatError extends ChatState {
  ChatError();
}
