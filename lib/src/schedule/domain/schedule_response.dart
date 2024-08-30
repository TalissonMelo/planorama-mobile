class ScheduleResponse {
  String id;
  String name;
  String ownerId;
  String endTime;
  String startTime;

  ScheduleResponse({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.endTime,
    required this.startTime,
  });

  static ScheduleResponse fromMap(Map map) {
    return ScheduleResponse(
      id: map['id'],
      name: map['name'],
      ownerId: map['ownerId'],
      endTime: map['endTime'],
      startTime: map['startTime'],
    );
  }
}
