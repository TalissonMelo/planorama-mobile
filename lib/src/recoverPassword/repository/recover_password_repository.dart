import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/change_password.dart';

class RecoverPasswordRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> execute(ChangePassword password) async {
    return await _httpManager.restRequest(
      url: Endpoints.recoverPasswordCode,
      methodHttp: HttpMethods.put,
      body: password.toJson(),
    );
  }
}
