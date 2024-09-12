import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/sessions/model/session_response.dart';
import 'package:liberbox_mobile/src/sessions/service/result/session_result.dart';
import 'package:liberbox_mobile/src/sessions/service/session_service.dart';

class SessionController extends GetxController {
  RxBool isLoading = false.obs;

  final sessionService = SessionService();
  final toast = CustomToast();

  Future<List<SessionResponse>> list(
    String scheduleId,
    int month,
    int year,
  ) async {
    isLoading.value = true;

    SessionResult result = await sessionService.execute(
      scheduleId,
      month,
      year,
    );

    List<SessionResponse> sessions = [];
    result.when(success: (response) {
      sessions = response;
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
    return sessions;
  }
}
