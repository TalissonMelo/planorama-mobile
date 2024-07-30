import 'package:liberbox_mobile/src/home/domain/session.dart';

class RegisteredAppointments {
  String id;
  String name;
  String startTime;
  String endTime;
  List<Session> sessions;

  RegisteredAppointments({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.sessions,
  });
}
