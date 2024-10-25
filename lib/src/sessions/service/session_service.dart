import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/sessions/model/session_response.dart';
import 'package:liberbox_mobile/src/sessions/repository/session_repository.dart';
import 'package:liberbox_mobile/src/sessions/service/result/session_result.dart';

class SessionService {
  final sessionRepository = SessionRepository();
  final authController = Get.find<AuthController>();

  Future<SessionResult> execute(
    String scheduleId,
    int month,
    int year,
  ) async {
    final result = await sessionRepository.execute(
        scheduleId,
        authController.user.id!,
        'Bearer ${authController.user.accessToken}',
        month,
        year);

    try {
      if (result.success) {
        List<SessionResponse> sessions = (result.data as List)
            .map((item) => SessionResponse.fromMap(item))
            .toList();

        return SessionResult.success(sessions);
      } else {
        return SessionResult.error(result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return SessionResult.error(result.errorMessage ?? '');
    }
  }
}
