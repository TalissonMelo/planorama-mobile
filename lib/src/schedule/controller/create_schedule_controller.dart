import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_request.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_response.dart';
import 'package:liberbox_mobile/src/schedule/service/create_schedule_service.dart';
import 'package:liberbox_mobile/src/schedule/service/result/create_schedule_result.dart';

class CreateScheduleController extends GetxController {
  RxBool isLoading = false.obs;

  final createScheduleService = CreateScheduleService();
  final toast = CustomToast();

  Future<ScheduleResponse?> created({
    required String name,
    required String endTime,
    required String startTime,
  }) async {
    isLoading.value = true;

    CreateScheduleResult result = await createScheduleService.execute(
        ScheduleRequest(name: name, endTime: endTime, startTime: startTime));

    result.when(success: (response) {
      return response;
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
    return null;
  }
}
