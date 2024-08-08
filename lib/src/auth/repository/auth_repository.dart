import 'package:liberbox_mobile/src/auth/model/login.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future<Map> signIn(Login login) async {
    return await _httpManager.restRequest(
      url: Endpoints.signin,
      methodHttp: HttpMethods.post,
      body: login.toJson(),
    );
  }
}
