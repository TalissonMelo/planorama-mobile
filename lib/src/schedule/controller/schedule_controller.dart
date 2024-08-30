import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_response.dart';
import 'package:liberbox_mobile/src/schedule/service/result/schedule_result.dart';
import 'package:liberbox_mobile/src/schedule/service/schedule_service.dart';

class ScheduleController extends GetxController {
  RxBool isLoading = false.obs;

  final scheduleService = ScheduleService();
  final toast = CustomToast();

  Future<List<ScheduleResponse>> list() async {
    isLoading.value = true;

    ScheduleResult result = await scheduleService.execute();

    List<ScheduleResponse> schedules = [];
    result.when(success: (response) {
      schedules = response;
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
    return schedules;
  }
}
