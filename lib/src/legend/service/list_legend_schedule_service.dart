import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';
import 'package:liberbox_mobile/src/legend/repository/legend_repository.dart';
import 'package:liberbox_mobile/src/legend/service/result/list_legend_result.dart';

class ListLegendScheduleService {
  final legendRepository = LegendRepository();
  final authController = Get.find<AuthController>();

  Future<ListLegendResult> execute(String scheduleId) async {
    final result = await legendRepository.listLegendScheduleId(
      scheduleId,
      authController.user.id!,
      'Bearer ${authController.user.authorization}',
    );

    try {
      if (result.success) {
        List<LegendResponse> legends = (result.data as List)
            .map((item) => LegendResponse.fromMap(item))
            .toList();

        return ListLegendResult.success(legends);
      } else {
        return ListLegendResult.error(result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return ListLegendResult.error(result.errorMessage ?? '');
    }
  }
}
