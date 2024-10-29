import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/profile/model/configuration.dart';

class ConfigurationRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> execute(
    String userId,
    Configuration configuration,
    String token,
  ) async {
    return await _httpManager.restRequest(
        url: Endpoints.changeUserSettings(userId),
        methodHttp: HttpMethods.post,
        body: configuration.toMap(),
        headers: {
          'Authorization': token,
        });
  }
}
