import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/code_request.dart';

class CheckPhoneCodeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> execute(CodeRequest code) async {
    return await _httpManager.restRequest(
      url: Endpoints.checkPhoneCode,
      methodHttp: HttpMethods.post,
      body: code.toJson(),
    );
  }
}
