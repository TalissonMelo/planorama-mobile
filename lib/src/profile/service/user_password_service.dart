import 'package:liberbox_mobile/src/profile/model/user_password_change.dart';
import 'package:liberbox_mobile/src/profile/repository/user_password_repository.dart';
import 'package:liberbox_mobile/src/profile/service/result/user_password_result.dart';

class UserPasswordService {
  final userPasswordRepository = UserPasswordRepository();

  Future<UserPasswordResult> execute(
    String userId,
    UserPasswordChange password,
  ) async {
    final result = await userPasswordRepository.execute(userId, password);

    try {
      return UserPasswordResult.success();
    } catch (error) {
      return UserPasswordResult.error(result.errorMessage ?? '');
    }
  }
}
