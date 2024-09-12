import 'package:get/get.dart';
import 'package:liberbox_mobile/src/chat/domain/message.dart';
import 'package:liberbox_mobile/src/chat/domain/message_response.dart';
import 'package:liberbox_mobile/src/chat/service/chat_service.dart';
import 'package:liberbox_mobile/src/chat/service/result/chat_result.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';

class ChatController extends GetxController {
  RxBool isLoading = false.obs;

  final chatService = ChatService();
  final toast = CustomToast();

  Future<MessageResponse?> created({
    required String sessionId,
    required String message,
  }) async {
    isLoading.value = true;

    ChatResult result = await chatService.execute(
      sessionId,
      Message(content: message),
    );

    return result.when(success: (response) {
      isLoading.value = false;
      return response;
    }, error: (message) {
      isLoading.value = false;
      toast.showToast(message: message, isError: true);
      return null;
    });
  }
}
