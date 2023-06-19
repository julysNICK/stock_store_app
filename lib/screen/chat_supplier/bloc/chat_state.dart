part of 'chat_bloc.dart';

@immutable
abstract class ChatState {
  List<dynamic>? mensagens = [];

  ChatState({this.mensagens});
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
  ChatLoaded({required List<dynamic> mensagens}) : super(mensagens: mensagens);

  @override
  String toString() => 'ChatLoaded';
}

class ChatMenssagemAdd extends ChatState {
  ChatMenssagemAdd({required List<dynamic> mensagens})
      : super(mensagens: mensagens);

  @override
  String toString() => 'ChatMenssagemAdd';
}

class ChatError extends ChatState {
  ChatError();
}
