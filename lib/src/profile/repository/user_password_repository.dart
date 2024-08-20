import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/profile/model/user_password_change.dart';

class UserPasswordRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> execute(
    String userId,
    UserPasswordChange password,
    String token,
  ) async {
    return await _httpManager.restRequest(
        url: Endpoints.changeUserPassword(userId),
        methodHttp: HttpMethods.put,
        body: password.toJson(),
        headers: {
          'Authorization': token,
          'X-UserID': userId,
        });
  }
}
