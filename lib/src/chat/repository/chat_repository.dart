import 'package:liberbox_mobile/src/chat/domain/message.dart';
import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';

class ChatRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> createMessage(
    String sessionId,
    Message message,
    String userId,
    String token,
  ) async {
    return await _httpManager.restRequest(
        url: Endpoints.createMessage(sessionId),
        methodHttp: HttpMethods.post,
        body: message.toJson(),
        headers: {
          'Authorization': token,
          'X-UserID': userId,
        });
  }
}
