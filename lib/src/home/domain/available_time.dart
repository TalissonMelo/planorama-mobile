import 'package:liberbox_mobile/src/home/domain/times.dart';

class AvailableTime {
  String id;
  String title;
  List<Times> times;

  AvailableTime({
    required this.id,
    required this.title,
    required this.times,
  });

  static AvailableTime fromMap(Map map) {
    return AvailableTime(
      id: map['id'],
      title: map['title'],
      times: (map['times'] as List).map((item) => Times.fromMap(item)).toList(),
    );
  }
}
