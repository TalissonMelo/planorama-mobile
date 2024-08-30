class Times {
  String endTime;
  String startTime;

  Times({
    required this.endTime,
    required this.startTime,
  });

  static Times fromMap(Map map) {
    return Times(
      endTime: map['endTime'],
      startTime: map['startTime'],
    );
  }
}
