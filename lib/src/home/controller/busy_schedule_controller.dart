import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/home/domain/registered_appointment.dart';
import 'package:liberbox_mobile/src/home/service/busy_schedule_service.dart';
import 'package:liberbox_mobile/src/home/service/result/busy_schedule_result.dart';

class BusyScheduleController extends GetxController {
  RxBool isLoading = false.obs;

  final busyScheduleService = BusyScheduleService();
  final toast = CustomToast();

  Future<List<RegisteredAppointment>> list() async {
    isLoading.value = true;

    BusyScheduleResult result = await busyScheduleService.execute();

    List<RegisteredAppointment> registeredAppointments = [];
    result.when(success: (response) {
      registeredAppointments = response;
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
    return registeredAppointments;
  }
}
