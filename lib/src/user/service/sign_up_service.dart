import 'package:liberbox_mobile/src/user/domain/user.dart';
import 'package:liberbox_mobile/src/user/domain/user_request.dart';
import 'package:liberbox_mobile/src/user/repository/sign_up_repository.dart';
import 'package:liberbox_mobile/src/user/service/result/sign_up_result.dart';

class SignUpService {
  final signUpRepository = SignUpRepository();

  Future<SignUpResult> execute(UserRequest user) async {
    final result = await signUpRepository.execute(user);

    try {
      User user = User.fromMap(result.data);
      return SignUpResult.success(user);
    } catch (error) {
      return SignUpResult.error(result.errorMessage ?? '');
    }
  }
}
