import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';

class SessionRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> execute(
    String scheduleId,
    String userId,
    String token,
    int month,
    int year,
  ) async {
    return await _httpManager.restRequest(
      url: Endpoints.sessionsToScheduleId(scheduleId),
      methodHttp: HttpMethods.get,
      headers: {
        'Authorization': token,
        'X-UserID': userId,
      },
      params: {
        'month': month,
        'year': year,
      },
    );
  }
}
