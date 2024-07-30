class SessionRequest {
  String scheduleId;
  String legendId;
  String title;
  DateTime start;
  DateTime end;
  String description;
  List<DayOfWeek> daysOfWeeks;

  SessionRequest(
      {required this.scheduleId,
      required this.legendId,
      required this.title,
      required this.start,
      required this.end,
      required this.description,
      required this.daysOfWeeks});
}

enum DayOfWeek {
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY,
}
