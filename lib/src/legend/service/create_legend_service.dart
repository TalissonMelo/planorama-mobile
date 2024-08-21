import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/legend/model/legend_request.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';
import 'package:liberbox_mobile/src/legend/repository/legend_repository.dart';
import 'package:liberbox_mobile/src/legend/service/result/create_legend_result.dart';

class CreateLegendService {
  final legendRepository = LegendRepository();
  final authController = Get.find<AuthController>();

  Future<CreateLegendResult> execute(LegendRequest legend) async {
    final result = await legendRepository.createLegend(
      authController.user.id!,
      'Bearer ${authController.user.authorization}',
      legend,
    );

    try {
      if (result.success) {
        LegendResponse legend = LegendResponse.fromMap(result.data);
        return CreateLegendResult.success(legend);
      } else {
        return CreateLegendResult.error(result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return CreateLegendResult.error(result.errorMessage ?? '');
    }
  }
}
