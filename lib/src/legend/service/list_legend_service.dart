import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';
import 'package:liberbox_mobile/src/legend/repository/legend_repository.dart';
import 'package:liberbox_mobile/src/legend/service/result/list_legend_result.dart';

class ListLegendService {
  final legendRepository = LegendRepository();
  final authController = Get.find<AuthController>();

  Future<ListLegendResult> execute() async {
    final result = await legendRepository.listLegend(
      authController.user.id!,
      'Bearer ${authController.user.accessToken}',
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
