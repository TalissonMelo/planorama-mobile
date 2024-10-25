import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/home/domain/available_time.dart';
import 'package:liberbox_mobile/src/home/repository/schedule_repository.dart';
import 'package:liberbox_mobile/src/home/service/result/free_time_schedule_result.dart';

class FreeTimeScheduleService {
  final scheduleRepository = ScheduleRepository();
  final authController = Get.find<AuthController>();

  Future<FreeTimeScheduleResult> execute(int minutes) async {
    final result = await scheduleRepository.listFreeTimesSchedules(
      authController.user.id!,
      'Bearer ${authController.user.accessToken}',
      minutes,
    );

    try {
      if (result.success) {
        List<AvailableTime> availableTimes = (result.data as List)
            .map((item) => AvailableTime.fromMap(item))
            .toList();

        return FreeTimeScheduleResult.success(availableTimes);
      } else {
        return FreeTimeScheduleResult.error(
            result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return FreeTimeScheduleResult.error(result.errorMessage ?? '');
    }
  }
}
