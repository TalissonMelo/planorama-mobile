import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';
import 'package:liberbox_mobile/src/legend/service/list_legend_service.dart';
import 'package:liberbox_mobile/src/legend/service/result/list_legend_result.dart';

class ListLegendController extends GetxController {
  RxBool isLoading = false.obs;

  final listLegendService = ListLegendService();
  final toast = CustomToast();

  Future<List<LegendResponse>> list() async {
    isLoading.value = true;

    ListLegendResult result = await listLegendService.execute();

    List<LegendResponse> legends = [];
    result.when(success: (response) {
      legends = response;
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
    return legends;
  }
}
