import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/home/domain/registered_appointment.dart';
import 'package:liberbox_mobile/src/home/repository/schedule_repository.dart';
import 'package:liberbox_mobile/src/home/service/result/busy_schedule_result.dart';

class BusyScheduleService {
  final scheduleRepository = ScheduleRepository();
  final authController = Get.find<AuthController>();

  Future<BusyScheduleResult> execute() async {
    final result = await scheduleRepository.listSchedules(
      authController.user.id!,
      'Bearer ${authController.user.authorization}',
    );

    try {
      if (result.success) {
        List<RegisteredAppointment> registeredAppointments =
            (result.data as List)
                .map((item) => RegisteredAppointment.fromMap(item))
                .toList();

        return BusyScheduleResult.success(registeredAppointments);
      } else {
        return BusyScheduleResult.error(result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return BusyScheduleResult.error(result.errorMessage ?? '');
    }
  }
}
