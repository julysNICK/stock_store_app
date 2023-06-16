class Chat {
  final String room;
  final String author;
  final String content;

  Chat({required this.room, required this.author, required this.content});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      room: json['room'],
      author: json['author'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'room': room,
      'author': author,
      'content': content,
    };
  }
}
