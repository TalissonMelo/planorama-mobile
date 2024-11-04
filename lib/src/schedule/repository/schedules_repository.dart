import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/constants/storage_keys.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/profile/model/configuration.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_request.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

class SchedulesRepository {
  final HttpManager _httpManager = HttpManager();
  final UtilService _utilService = UtilService();

  Future<CustomApiAdvice> listSchedules(String userId, String token) async {
    Configuration? configuration =
        await _utilService.getLocalSettings(key: StorageKeys.settings);

    return await _httpManager.restRequest(
      url: Endpoints.listSchedule(userId),
      methodHttp: HttpMethods.get,
      headers: {
        'Authorization': token,
        'timezone': configuration?.timeZone ?? '',
      },
    );
  }

  Future<CustomApiAdvice> createSchedule(
    String userId,
    String token,
    ScheduleRequest schedule,
  ) async {
    Configuration? configuration =
        await _utilService.getLocalSettings(key: StorageKeys.settings);
    return await _httpManager.restRequest(
        url: Endpoints.listSchedule(userId),
        methodHttp: HttpMethods.post,
        body: schedule.toJson(),
        headers: {
          'Authorization': token,
          'timezone': configuration?.timeZone ?? '',
        });
  }
}
