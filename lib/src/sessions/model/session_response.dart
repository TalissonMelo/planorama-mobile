import 'package:liberbox_mobile/src/sessions/model/legend_color.dart';

class SessionResponse {
  String id;
  String scheduleId;
  LegendColor color;
  String title;
  DateTime start;
  DateTime end;
  String description;

  SessionResponse({
    required this.id,
    required this.scheduleId,
    required this.color,
    required this.title,
    required this.start,
    required this.end,
    required this.description,
  });
}
