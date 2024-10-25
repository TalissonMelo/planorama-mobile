import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_request.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_response.dart';
import 'package:liberbox_mobile/src/schedule/repository/schedules_repository.dart';
import 'package:liberbox_mobile/src/schedule/service/result/create_schedule_result.dart';

class CreateScheduleService {
  final schedulesRepository = SchedulesRepository();
  final authController = Get.find<AuthController>();

  Future<CreateScheduleResult> execute(ScheduleRequest schedule) async {
    final result = await schedulesRepository.createSchedule(
      authController.user.id!,
      'Bearer ${authController.user.accessToken}',
      schedule,
    );

    try {
      if (result.success) {
        ScheduleResponse schedules = ScheduleResponse.fromMap(result.data);
        return CreateScheduleResult.success(schedules);
      } else {
        return CreateScheduleResult.error(
            result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return CreateScheduleResult.error(result.errorMessage ?? '');
    }
  }
}
