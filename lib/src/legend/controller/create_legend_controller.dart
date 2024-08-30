import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/legend/model/legend_request.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';
import 'package:liberbox_mobile/src/legend/service/create_legend_service.dart';
import 'package:liberbox_mobile/src/legend/service/result/create_legend_result.dart';

class CreateLegendController extends GetxController {
  RxBool isLoading = false.obs;

  final createLegendService = CreateLegendService();
  final toast = CustomToast();

  Future<LegendResponse?> created({
    required String description,
    required String color,
  }) async {
    isLoading.value = true;

    CreateLegendResult result = await createLegendService.execute(LegendRequest(
      color: color,
      description: description,
    ));

    return result.when(success: (response) {
      isLoading.value = false;
      return response;
    }, error: (message) {
      isLoading.value = false;
      toast.showToast(message: message, isError: true);
      return null;
    });
  }
}
