class ScheduleResponse {
  String id;
  String name;
  String userId;
  String endTime;
  String startTime;

  ScheduleResponse({
    required this.id,
    required this.name,
    required this.userId,
    required this.endTime,
    required this.startTime,
  });

  static ScheduleResponse fromMap(Map map) {
    return ScheduleResponse(
      id: map['id'],
      name: map['name'],
      userId: map['userId'],
      endTime: map['endTime'],
      startTime: map['startTime'],
    );
  }
}
