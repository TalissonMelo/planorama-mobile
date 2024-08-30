import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_response.dart';

part 'schedule_result.freezed.dart';

@freezed
class ScheduleResult with _$ScheduleResult {
  factory ScheduleResult.success(List<ScheduleResponse> schedules) = Success;
  factory ScheduleResult.error(String message) = Error;
}

//flutter pub run build_runner build
