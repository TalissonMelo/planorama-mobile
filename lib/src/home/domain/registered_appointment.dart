import 'package:liberbox_mobile/src/home/domain/session.dart';

class RegisteredAppointment {
  String id;
  String name;
  String startTime;
  String endTime;
  List<Session> sessions;

  RegisteredAppointment({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.sessions,
  });

  static RegisteredAppointment fromMap(Map map) {
    return RegisteredAppointment(
      id: map['id'],
      name: map['name'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      sessions: (map['sessions'] as List)
          .map((item) => Session.fromMap(item))
          .toList(),
    );
  }
}
