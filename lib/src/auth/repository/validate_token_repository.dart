import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';

class ValidateTokenRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> validateToken(String token) async {
    return await _httpManager.restRequest(
      url: Endpoints.validToken,
      methodHttp: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}
