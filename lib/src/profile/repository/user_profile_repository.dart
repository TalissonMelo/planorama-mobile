import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/profile/model/user_profile_edit.dart';

class UserProfileRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> execute(
    String userId,
    UserProfileEdit user,
    String token,
  ) async {
    return await _httpManager.restRequest(
        url: Endpoints.changeUserProfile(userId),
        methodHttp: HttpMethods.put,
        body: user.toJson(),
        headers: {
          'Authorization': token,
        });
  }
}
