import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_response.dart';

part 'create_schedule_result.freezed.dart';

@freezed
class CreateScheduleResult with _$CreateScheduleResult {
  factory CreateScheduleResult.success(ScheduleResponse schedules) = Success;
  factory CreateScheduleResult.error(String message) = Error;
}

//flutter pub run build_runner build
