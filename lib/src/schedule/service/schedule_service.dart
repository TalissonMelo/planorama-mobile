import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_response.dart';
import 'package:liberbox_mobile/src/schedule/repository/schedules_repository.dart';
import 'package:liberbox_mobile/src/schedule/service/result/schedule_result.dart';

class ScheduleService {
  final schedulesRepository = SchedulesRepository();
  final authController = Get.find<AuthController>();

  Future<ScheduleResult> execute() async {
    final result = await schedulesRepository.listSchedules(
      authController.user.id!,
      'Bearer ${authController.user.accessToken}',
    );

    try {
      if (result.success) {
        List<ScheduleResponse> schedules = (result.data as List)
            .map((item) => ScheduleResponse.fromMap(item))
            .toList();

        return ScheduleResult.success(schedules);
      } else {
        return ScheduleResult.error(result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return ScheduleResult.error(result.errorMessage ?? '');
    }
  }
}
