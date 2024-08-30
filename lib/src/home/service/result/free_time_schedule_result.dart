import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/home/domain/available_time.dart';

part 'free_time_schedule_result.freezed.dart';

@freezed
class FreeTimeScheduleResult with _$FreeTimeScheduleResult {
  factory FreeTimeScheduleResult.success(List<AvailableTime> availableTimes) =
      Success;
  factory FreeTimeScheduleResult.error(String message) = Error;
}

//flutter pub run build_runner build
