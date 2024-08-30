import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';

class ScheduleRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> listSchedules(String userId, String token) async {
    return await _httpManager.restRequest(
      url: Endpoints.listSchedules,
      methodHttp: HttpMethods.get,
      headers: {
        'Authorization': token,
        'X-UserID': userId,
      },
      params: {
        'date': DateTime.now().toIso8601String().split('T')[0],
      },
    );
  }

  Future<CustomApiAdvice> listFreeTimesSchedules(
    String userId,
    String token,
    int minutes,
  ) async {
    return await _httpManager.restRequest(
      url: Endpoints.listFreeTimesSchedules,
      methodHttp: HttpMethods.get,
      headers: {
        'Authorization': token,
        'X-UserID': userId,
      },
      params: {
        'date': DateTime.now().toIso8601String().split('T')[0],
        'minutes': minutes,
      },
    );
  }
}
