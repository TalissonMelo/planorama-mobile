class Session {
  String id;
  String title;
  String endTime;
  String startTime;
  String? description;

  Session({
    required this.id,
    required this.title,
    required this.endTime,
    required this.startTime,
    this.description,
  });

  static Session fromMap(Map map) {
    return Session(
      id: map['id'],
      title: map['title'],
      endTime: map['endTime'],
      startTime: map['startTime'],
      description: map['description'],
    );
  }
}
