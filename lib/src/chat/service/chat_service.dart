import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/chat/domain/message.dart';
import 'package:liberbox_mobile/src/chat/domain/message_response.dart';
import 'package:liberbox_mobile/src/chat/repository/chat_repository.dart';
import 'package:liberbox_mobile/src/chat/service/result/chat_result.dart';

class ChatService {
  final chatRepository = ChatRepository();
  final authController = Get.find<AuthController>();

  Future<ChatResult> execute(
    String sessionId,
    Message message,
  ) async {
    final result = await chatRepository.createMessage(
      sessionId,
      message,
      authController.user.id!,
      'Bearer ${authController.user.authorization}',
    );

    try {
      if (result.success) {
        MessageResponse response = MessageResponse.fromMap(result.data);
        return ChatResult.success(response);
      } else {
        return ChatResult.error(result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return ChatResult.error(result.errorMessage ?? '');
    }
  }
}
