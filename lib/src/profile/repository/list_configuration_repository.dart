import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';

class ListConfigurationRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> execute(
    String userId,
    String token,
  ) async {
    return await _httpManager.restRequest(
        url: Endpoints.changeUserSettings(userId),
        methodHttp: HttpMethods.get,
        headers: {
          'Authorization': token,
        });
  }
}
