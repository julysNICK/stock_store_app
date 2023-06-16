part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ChatEvent';
}

class ChatLoad extends ChatEvent {
  final String id;
  final String message;
  final String sender;
  final String receiver;

  ChatLoad(
      {required this.id,
      required this.message,
      required this.sender,
      required this.receiver});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'ChatLoad { id: $id }';
}

class ChatConnect extends ChatEvent {
  final String room;

  ChatConnect({required this.room});

  @override
  List<Object> get props => [room];

  @override
  String toString() => 'ChatConnect { room: $room }';
}

class ChatRefresh extends ChatEvent {
  ChatRefresh();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ChatRefresh';
}
