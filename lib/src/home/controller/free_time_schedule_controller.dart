import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/home/domain/available_time.dart';
import 'package:liberbox_mobile/src/home/service/free_time_schedule_service.dart';
import 'package:liberbox_mobile/src/home/service/result/free_time_schedule_result.dart';

class FreeTimeScheduleController extends GetxController {
  RxBool isLoading = false.obs;

  final freeTimeScheduleService = FreeTimeScheduleService();
  final toast = CustomToast();

  Future<List<AvailableTime>> list({required int minutes}) async {
    isLoading.value = true;

    FreeTimeScheduleResult result =
        await freeTimeScheduleService.execute(minutes);

    List<AvailableTime> availableTimes = [];

    result.when(success: (response) {
      availableTimes = response;
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
    return availableTimes;
  }
}
