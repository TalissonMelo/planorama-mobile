import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/recover_email.dart';

class SendPhoneCodeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> execute(RecoverEmail email) async {
    return await _httpManager.restRequest(
      url: Endpoints.sendPhoneCode,
      methodHttp: HttpMethods.put,
      body: email.toJson(),
    );
  }
}
