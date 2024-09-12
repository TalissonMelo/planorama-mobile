class MessageResponse {
  String content;
  bool user;

  MessageResponse({required this.content, required this.user});

  static MessageResponse fromMap(Map map) {
    return MessageResponse(
      content: map['content'],
      user: map['user'] ?? false,
    );
  }
}
