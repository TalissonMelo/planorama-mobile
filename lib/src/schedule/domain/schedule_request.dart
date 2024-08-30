class ScheduleRequest {
  String name;
  String endTime;
  String startTime;

  ScheduleRequest({
    required this.name,
    required this.endTime,
    required this.startTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'endTime': endTime,
      'startTime': startTime,
    };
  }
}
