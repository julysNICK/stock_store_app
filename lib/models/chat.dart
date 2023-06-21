class Chat {
  final String room;
  final String author;
  final String content;
  final bool isMe;

  Chat(
      {required this.room,
      required this.author,
      required this.content,
      this.isMe = false});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      room: json['room'],
      author: json['author'],
      content: json['content'],
      isMe: json['isMe'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'room': room,
      'author': author,
      'content': content,
      'isMe': isMe,
    };
  }
}
