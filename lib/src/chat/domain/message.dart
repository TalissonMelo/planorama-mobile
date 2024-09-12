class Message {
  String content;

  Message({
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {'content': content};
  }
}
