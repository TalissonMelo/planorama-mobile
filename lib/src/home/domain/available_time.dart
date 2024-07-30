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
}
