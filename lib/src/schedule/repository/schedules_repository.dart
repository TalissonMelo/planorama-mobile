import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_request.dart';

class SchedulesRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> listSchedules(String userId, String token) async {
    return await _httpManager.restRequest(
      url: Endpoints.listSchedule,
      methodHttp: HttpMethods.get,
      headers: {
        'Authorization': token,
        'X-UserID': userId,
      },
    );
  }

  Future<CustomApiAdvice> createSchedule(
    String userId,
    String token,
    ScheduleRequest schedule,
  ) async {
    return await _httpManager.restRequest(
        url: Endpoints.listSchedule,
        methodHttp: HttpMethods.post,
        body: schedule.toJson(),
        headers: {
          'Authorization': token,
          'X-UserID': userId,
        });
  }
}
