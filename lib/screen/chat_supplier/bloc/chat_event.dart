part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ChatEvent';
}

class ChatLoad extends ChatEvent {
  List<dynamic> mensagens;
  String message;
  String IdSender;
  String author;

  ChatLoad({
    required this.mensagens,
    required this.message,
    required this.IdSender,
    required this.author,
  });

  @override
  List<Object> get props => [IdSender];

  @override
  String toString() => 'ChatLoad { id: $IdSender}';
}

class ChatConnect extends ChatEvent {
  List<dynamic> mensagens;

  Function(void Function()) setState;

  ChatConnect({
    required this.mensagens,
    required this.setState,
  });

  @override
  List<Object> get props => [
        mensagens,
        setState,
      ];

  @override
  String toString() => 'ChatConnect { mensagens: $mensagens }';
}

class ChatMenssagemAddEvent extends ChatEvent {
  List<dynamic> mensagens;
  String message;
  String IdSender;
  String author;

  Function(void Function()) setState;

  ChatMenssagemAddEvent({
    required this.mensagens,
    required this.setState,
    required this.message,
    required this.IdSender,
    required this.author,
  });

  @override
  List<Object> get props => [
        mensagens,
        setState,
      ];

  @override
  String toString() => 'ChatMenssagemAdd { mensagens: $mensagens }';
}

class ChatRefresh extends ChatEvent {
  ChatRefresh();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ChatRefresh';
}
