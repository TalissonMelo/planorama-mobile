import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/home/domain/registered_appointment.dart';

part 'busy_schedule_result.freezed.dart';

@freezed
class BusyScheduleResult with _$BusyScheduleResult {
  factory BusyScheduleResult.success(
      List<RegisteredAppointment> registeredAppointments) = Success;
  factory BusyScheduleResult.error(String message) = Error;
}

//flutter pub run build_runner build
