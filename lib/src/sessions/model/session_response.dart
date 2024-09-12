import 'package:intl/intl.dart';
import 'package:liberbox_mobile/src/sessions/model/legend_color.dart';

class SessionResponse {
  String id;
  String scheduleId;
  LegendColor color;
  String title;
  DateTime start;
  DateTime end;
  String? description;

  SessionResponse({
    required this.id,
    required this.scheduleId,
    required this.color,
    required this.title,
    required this.start,
    required this.end,
    this.description,
  });

  static SessionResponse fromMap(Map map) {
    return SessionResponse(
      id: map['id'],
      scheduleId: map['scheduleId'],
      color: LegendColor.fromMap(map['color']),
      title: map['title'],
      start: DateTime.parse(map['start']),
      end: DateTime.parse(map['end']),
      description: map['description'],
    );
  }

  String formatHour(DateTime dateTime) {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }
}
