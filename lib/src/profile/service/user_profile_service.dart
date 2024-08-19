import 'package:liberbox_mobile/src/profile/model/user_profile_edit.dart';
import 'package:liberbox_mobile/src/profile/model/user_response.dart';
import 'package:liberbox_mobile/src/profile/repository/user_profile_repository.dart';
import 'package:liberbox_mobile/src/profile/service/result/user_profile_result.dart';

class UserProfileService {
  final userProfileRepository = UserProfileRepository();

  Future<UserProfileResult> execute(
    String userId,
    UserProfileEdit user,
  ) async {
    final result = await userProfileRepository.execute(userId, user);

    try {
      UserResponse user = UserResponse.fromMap(result.data);
      return UserProfileResult.success(user);
    } catch (error) {
      return UserProfileResult.error(result.errorMessage ?? '');
    }
  }
}
