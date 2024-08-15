import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/user/domain/user_request.dart';

class SignUpRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> execute(UserRequest user) async {
    return await _httpManager.restRequest(
      url: Endpoints.signup,
      methodHttp: HttpMethods.post,
      body: user.toJson(),
    );
  }
}
