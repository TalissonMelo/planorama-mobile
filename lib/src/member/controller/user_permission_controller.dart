import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/member/domain/user_permissions.dart';
import 'package:liberbox_mobile/src/member/service/result/user_permission_result.dart';
import 'package:liberbox_mobile/src/member/service/user_permission_service.dart';

class UserPermissionController extends GetxController {
  RxBool isLoading = false.obs;

  final userPermissionService = UserPermissionService();
  final toast = CustomToast();

  Future<UserPermissions?> userProfile() async {
    isLoading.value = true;

    UserPermissionResult result = await userPermissionService.execute();

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
